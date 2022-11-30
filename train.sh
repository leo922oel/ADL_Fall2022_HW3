export CUDA_VISIBLE_DEVICES=0

python run_sum.py \
    --do_train \
    --do_eval \
    --model_name_or_path google/mt5-small \
    --train_file ./data/train.jsonl \
    --validation_file ./data/public.jsonl \
    --output_dir ./google/mt5-small \
    --num_train_epochs 1 \
    --per_device_train_batch_size 4 \
    --gradient_accumulation_steps 16 \
    --per_device_eval_batch_size 4 \
    --eval_accumulation_steps 16 \
    --predict_with_generate \
    --text_column maintext \
    --summary_column title \
    --optim adafactor \
    --fp16 \
    --evaluation_strategy steps \
    --learning_rate 1e-3 \
    --save_total_limit 1 \
    --overwrite_output_dir \
    --preprocessing_num_workers 4 \
    --warmup_ratio 0.1