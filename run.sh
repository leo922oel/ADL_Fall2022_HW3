# ${1}: path to the input file
# ${2}: path to the output file

export CUDA_VISIBLE_DEVICES=0

python run_sum.py \
    --model_name_or_path ./mt5-summarization \
    --do_predict \
    --test_file $1 \
    --output_dir ./mt5-summarization \
    --output_file $2 \
    --per_device_eval_batch_size 1 \
    --eval_accumulation_steps 4 \
    --predict_with_generate \
    --text_column maintext \
    --summary_column title \
    --do_sample \
    --top_p 0.2