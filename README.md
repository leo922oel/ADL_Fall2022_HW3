# Homework 3 - Summarization
> Applied Deep Learning Fall 2022

## Dataset
[download link](https://drive.google.com/file/d/186ejZVADY16RBfVjzcMcz9bal9L3inXC/view)

## Environment
> python `3.8/3.9`

    # If you have conda, you can build a conda environment called "adl-hw1"
    make
    conda activate adl-hw2
    pip install -r requirement.txt

    # Otherwise
    pip install -r requirements.in

## training
```
python run_summarization.py \
  --do_train \
  --do_eval \
  --model_name_or_path <model_name_or_path> \
  --train_file <train_file> \
  --validation_file <validation_file> \
  --output_dir <output_dir> \
  --per_device_train_batch_size=1 \
  --gradient_accumulation_steps=4 \
  --per_device_eval_batch_size=1 \
  --eval_accumulation_steps=4 \
  --predict_with_generate \
  --text_column maintext \
  --summary_column title \
  --adafactor \
  --fp16 \
  --learning_rate 1e-3 \
  --warmup_ratio 0.1 \
```

## testing
```
python run_summarization.py \
  --do_predict \
  --model_name_or_path <model_name_or_path> \
  --test_file <test_file> \
  --output_file <output_file> \
  --output_dir <output_dir> \
  --predict_with_generate \
  --text_column maintext \
  --summary_column title \
  --per_device_eval_batch_size 4 \
  [--num_beams <num_beams>] \
  [--do_sample] \
  [--top_k <top_k>] \
  [--top_p <top_p>] \
  [--temperature <temperature>] \
```

## evaluation
[tw_rouge](https://github.com/moooooser999/ADL22-HW3)
```
usage: eval.py [-h] [-r REFERENCE] [-s SUBMISSION]
optional arguments:
  -h, --help            show this help message and exit
  -r REFERENCE, --reference REFERENCE
  -s SUBMISSION, --submission SUBMISSION
```

Example:
```
python eval.py -r public.jsonl -s submission.jsonl
{
  "rouge-1": {
    "f": 0.21999419163162043,
    "p": 0.2446195813913345,
    "r": 0.2137398792982201
  },
  "rouge-2": {
    "f": 0.0847583291303246,
    "p": 0.09419044877345074,
    "r": 0.08287844474014894
  },
  "rouge-l": {
    "f": 0.21017939117006337,
    "p": 0.25157090570020846,
    "r": 0.19404349000921203
  }
}
```

## Reproduce Result
```
bash ./download.sh
bash ./run.sh /path/to/input.jsonl /path/to/output.jsonl
```