export CUDA_VISIBLE_DEVICES=0

python run_sum.py \
    --do_predict \
    --model_name_or_path ./mt5_summarization \
    --test_file ./data/public.jsonl \
    --output_file ./pred.jsonl \
    --output_dir ./mt5_summarization/ \
    --per_device_eval_batch_size 1 \
    --eval_accumulation_steps 1 \
    --fp16 \
    --optim adafactor \
    --predict_with_generate \
    --text_column maintext \
    --summary_column title \
    --do_sample \
    --top_p 0.2