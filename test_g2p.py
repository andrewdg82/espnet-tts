from espnet2.text.g2p_vi_v1 import G2p_vi_v1
from espnet2.text.phoneme_tokenizer import G2p_en

# g2p_en = G2p_en(no_space=False)
# g2p = G2p_vi_v1()

text = "Được viết vào 6/4/2020, có thể xử lí những trường hợp chứa English"

# print(g2p_en(text))
# print(g2p(text))

from espnet2.text.phoneme_tokenizer import PhonemeTokenizer

phoneme_tokenizer = PhonemeTokenizer(g2p_type="g2p_vi_v1")
phoneme_tokenizer = PhonemeTokenizer(g2p_type="g2p_vi_v2")
tokens = phoneme_tokenizer.text2tokens(text)
print(tokens)
# text = phoneme_tokenizer.tokens2text(tokens)
# print(text)