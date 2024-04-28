#!/usr/bin/env bash
# Set bash to 'debug' mode, it will exit on :
# -e 'error', -u 'undefined variable', -o ... 'error in pipeline', -x 'print commands',
set -e
set -u
set -o pipefail

fs=22050
n_fft=1024
n_shift=256
feats_extract=fbank # linear_spectrogram

opts=
if [ "${fs}" -eq 22050 ]; then
    # To suppress recreation, specify wav format
    opts="--audio_format wav "
fi

train_set=train
valid_set=valid
test_sets=valid

# train_config=conf/tuning/train_joint_conformer_fastspeech2_hifigan.yaml
train_config=conf/tuning/train_jets.yaml
inference_config=conf/decode.yaml

g2p=g2p_vi_v1 # Include no word separator
# g2p=g2p_vi_v1_no_space # Include no word separator
cleaner=none

./tts.sh \
    --use_sid true \
    --tts_task gan_tts \
    --lang vi \
    --feats_type raw \
    --fs "${fs}" \
    --n_fft "${n_fft}" \
    --n_shift "${n_shift}" \
    --token_type phn \
    --cleaner "${cleaner}" \
    --g2p "${g2p}" \
    --train_config "${train_config}" \
    --inference_config "${inference_config}" \
    --train_set "${train_set}" \
    --valid_set "${valid_set}" \
    --test_sets "${test_sets}" \
    --srctexts "data/${train_set}/text" \
    ${opts} "$@"
