#!/bin/bash

src_dir=/home/ali_faizan/devops/Shell_Scriptong-Projects
tgt_dir=/home/ali_faizan/devops/Shell_Scriptong-Projects/backups

curr_timestamp=$(date "+%Y-%m-%d-%H-%M-%S")
 backup_file=$tgt_dir/$curr_timestamp.tgz
 echo "Taking backup on $curr_timestamp"

 echo"$backup_file"

 tar czf $backup_file --absolute-names $src_dir

 echo "backup completed"

