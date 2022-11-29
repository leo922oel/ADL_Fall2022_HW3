export CUDA_VISIBLE_DEVICES=0

python run_sum.py \
    --do_predict \
    --model_name_or_path ./t5-small \
    --test_file ./data/public.jsonl \
    --output_file ./pred.jsonl \
    --output_dir ./t5-small_summarization/ \
    --per_device_eval_batch_size 1 \
    --eval_accumulation_steps 1 \
    --predict_with_generate \
    --text_column maintext \
    --summary_column title \
    --num_beams 5