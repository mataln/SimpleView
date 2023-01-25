#!/bin/bash

set -x
set -e

export PYTHONUNBUFFERED="True"
LOG="log_txt/train_tree.txt.$(date +'%Y-%m-%d_%H-%M-%S')"
exec &> >(tee -a "${LOG}")

run="${1}"

python train.py \
    --resolution 256 \
    --num_point 8192 \
    --views 6 \
    --weight_decay 0 \
    --batch_size 60 \
    --aug \
    --sigma 0.01 \
    --clip 0.05 \
    --ratio 0.35 \
    --learning_rate 0.001 \
    --decay_rate 0.7 \
    --size 1 \
    --learning_rate_clip 0 \
    --num_class 33 \
    --kernel_size 3 \
    --conv_stride 1 \
    --first_pool_size 0 \
    --first_pool_stride 0 \
    --max_epoch 300 \
    --record_file records/tree_run_${run}.csv \
    --log_dir log/tree_run_${run} \
    --train_file ../data/h5_files/trees/0_0.2_TRAIN_SPLIT_train_publish_16384.h5 \
    --test_file ../data/h5_files/trees/0_0.2_TEST_SPLIT_train_publish_16384.h5
