export CUDA_VISIBLE_DEVICES=0

python run_sum.py \
    --do_train \
    --model_name_or_path google/mt5-small \
    --train_file ./data/train.jsonl \
    --output_dir ./google/mt5-small \
    --num_train_epochs 1 \
    --per_device_train_batch_size 1 \
    --gradient_accumulation_steps 10 \
    --predict_with_generate \
    --text_column maintext \
    --summary_column title \
    --optim adafactor \
    --learning_rate 1e-3 \
    --save_total_limit 3 \
    --overwrite_output_dir \
    --preprocessing_num_workers 4 \
    --warmup_ratio 0.1