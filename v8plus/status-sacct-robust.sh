#!/usr/bin/env bash

# Check status of Slurm job. Retries `sacct` with a short delay if slurmdbd
# has not yet registered a newly submitted job, with an `scontrol` fallback.

jobid="$1"

if [[ "$jobid" == Submitted ]]
then
  echo smk-simple-slurm: Invalid job ID: "$jobid" >&2
  echo smk-simple-slurm: Did you remember to add the flag --parsable to your sbatch call? >&2
  exit 1
fi

function get_status(){
  sacct -X -j "$1" --format State --noheader 2>/dev/null | head -n 1 | awk '{print $1}'
}

output=""
for i in {1..5}
do
  output=$(get_status "$jobid")
  if [[ -n "$output" ]]
  then
    break
  fi
  if [[ "$i" -lt 5 ]]
  then
    sleep 2
  fi
done

if [[ -z "$output" ]]
then
  output=$(scontrol show job "$jobid" 2>/dev/null | awk -F= '/JobState=/{print $2}' | awk '{print $1}' | head -n 1)
fi

if [[ -z "$output" ]]
then
  echo sacct failed to return the status for jobid "$jobid" >&2
  echo Maybe you need to use scontrol instead? >&2
  exit 1
fi

if [[ "$output" =~ ^(COMPLETED).* ]]
then
  echo success
elif [[ "$output" =~ ^(RUNNING|PENDING|COMPLETING|CONFIGURING|SUSPENDED|REQUEUED|RESIZING|STAGE_OUT).* ]]
then
  echo running
else
  echo failed
fi
