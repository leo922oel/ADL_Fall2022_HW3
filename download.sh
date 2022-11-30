pip install gdown

gdown https://drive.google.com/uc?id=1-Ll7aq5a01fOboVnM20vSapFA2_RrkuZ
mv pytorch_model.bin ./mt5-small/

python tw_rouge/twrouge.py

python -c "
import nltk
from filelock import FileLock
from transformers.file_utils import is_offline_mode
try:
    nltk.data.find(\"tokenizers/punkt\")
except (LookupError, OSError):
    if is_offline_mode():
        raise LookupError(\"Offline mode: run this script without TRANSFORMERS_OFFLINE first to download nltk data files\")
    with FileLock(\".lock\") as lock:
        nltk.download(\"punkt\", quiet=True)
"