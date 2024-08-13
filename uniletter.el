;;; uniletter.el --- Help to input Unicode letters   -*- lexical-binding: t; -*-

;; Copyright (C) 2022  USAMI Kenta

;; Author: USAMI Kenta <tadsan@zonu.me>
;; Keywords: wp

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; Help to input Unicode letters.

;;; Code:
(eval-when-compile
  (require 'cl-lib))

(defconst uniletter-ascii-characters
  '((?A ?B ?C ?D ?E ?F ?G ?H ?I ?J ?K ?L ?M ?N ?O ?P ?Q ?R ?S ?T ?U ?V ?W ?X ?Y ?Z)
    (?a ?b ?c ?d ?e ?f ?g ?h ?i ?j ?k ?l ?m ?n ?o ?p ?q ?r ?s ?t ?u ?v ?w ?x ?y ?z))
  "List of ASCII characters.")

(defvar uniletter-letters
  `(
    (:parenthesized-latin
     (?🄐 ?🄑 ?🄒 ?🄓 ?🄔 ?🄕 ?🄖 ?🄗 ?🄘 ?🄙 ?🄚 ?🄛 ?🄜 ?🄝 ?🄞 ?🄟 ?🄠 ?🄡 ?🄢 ?🄣 ?🄤 ?🄥 ?🄦 ?🄧 ?🄨 ?🄩)
     (?⒜ ?⒝ ?⒞ ?⒟ ?⒠ ?⒡ ?⒢ ?⒣ ?⒤ ?⒥ ?⒦ ?⒧ ?⒨ ?⒩ ?⒪ ?⒫ ?⒬ ?⒭ ?⒮ ?⒯ ?⒰ ?⒱ ?⒲ ?⒳ ?⒴ ?⒵))
    (:circled-latin
     (?Ⓐ ?Ⓑ ?Ⓒ ?Ⓓ ?Ⓔ ?Ⓕ ?Ⓖ ?Ⓗ ?Ⓘ ?Ⓙ ?Ⓚ ?Ⓛ ?Ⓜ ?Ⓝ ?Ⓞ ?Ⓟ ?Ⓠ ?Ⓡ ?Ⓢ ?Ⓣ ?Ⓤ ?Ⓥ ?Ⓦ ?Ⓧ ?Ⓨ ?Ⓩ)
     (?ⓐ ?ⓑ ?ⓒ ?ⓓ ?ⓔ ?ⓕ ?ⓖ ?ⓗ ?ⓘ ?ⓙ ?ⓚ ?ⓛ ?ⓜ ?ⓝ ?ⓞ ?ⓟ ?ⓠ ?ⓡ ?ⓢ ?ⓣ ?ⓤ ?ⓥ ?ⓦ ?ⓧ ?ⓨ ?ⓩ))
    (:italic
     (?𝐴 ?𝐵 ?𝐶 ?𝐷 ?𝐸 ?𝐹 ?𝐺 ?𝐻 ?𝐼 ?𝐽 ?𝐾 ?𝐿 ?𝑀 ?𝑁 ?𝑂 ?𝑃 ?𝑄 ?𝑅 ?𝑆 ?𝑇 ?𝑈 ?𝑉 ?𝑊 ?𝑋 ?𝑌 ?𝑍)
     (?𝑎 ?𝑏 ?𝑐 ?𝑑 ?𝑒 ?𝑓 ?𝑔 ?ℎ ?𝑖 ?𝑗 ?𝑘 ?𝑙 ?𝑚 ?𝑛 ?𝑜 ?𝑝 ?𝑞 ?𝑟 ?𝑠 ?𝑡 ?𝑢 ?𝑣 ?𝑤 ?𝑥 ?𝑦 ?𝑧))
    (:bold
     (?𝐀 ?𝐁 ?𝐂 ?𝐃 ?𝐄 ?𝐅 ?𝐆 ?𝐇 ?𝐈 ?𝐉 ?𝐊 ?𝐋 ?𝐌 ?𝐍 ?𝐎 ?𝐏 ?𝐐 ?𝐑 ?𝐒 ?𝐓 ?𝐔 ?𝐕 ?𝐖 ?𝐗 ?𝐘 ?𝐙)
     (?𝐚 ?𝐛 ?𝐜 ?𝐝 ?𝐞 ?𝐟 ?𝐠 ?𝐡 ?𝐢 ?𝐣 ?𝐤 ?𝐥 ?𝐦 ?𝐧 ?𝐨 ?𝐩 ?𝐪 ?𝐫 ?𝐬 ?𝐭 ?𝐮 ?𝐯 ?𝐰 ?𝐱 ?𝐲 ?𝐳))
    (:bold-italic
     (?𝑨 ?𝑩 ?𝑪 ?𝑫 ?𝑬 ?𝑭 ?𝑮 ?𝑯 ?𝑰 ?𝑱 ?𝑲 ?𝑳 ?𝑴 ?𝑵 ?𝑶 ?𝑷 ?𝑸 ?𝑹 ?𝑺 ?𝑻 ?𝑼 ?𝑽 ?𝑾 ?𝑿 ?𝒀 ?𝒁)
     (?𝒂 ?𝒃 ?𝒄 ?𝒅 ?𝒆 ?𝒇 ?𝒈 ?𝒉 ?𝒊 ?𝒋 ?𝒌 ?𝒍 ?𝒎 ?𝒏 ?𝒐 ?𝒑 ?𝒒 ?𝒓 ?𝒔 ?𝒕 ?𝒖 ?𝒗 ?𝒘 ?𝒙 ?𝒚 ?𝒛))
    (:ascii ,@uniletter-ascii-characters)))

;; (defvar uniletter-keymap
;;   (eval-when-compile
;;     (let ((map (make-keymap)))
;;       ())))

"
U+0041 - U+005A	LATIN CAPITAL LETTER	ASCIIコード	ABCDEFGHIJKLMNOPQRSTUVWXYZ
U+0061 - U+007A	LATIN SMALL LETTER	ASCIIコード	abcdefghijklmnopqrstuvwxyz
U+249C - U+24B5	PARENTHESIZED LATIN SMALL LETTER	括弧付きラテン文字	⒜⒝⒞⒟⒠⒡⒢⒣⒤⒥⒦⒧⒨⒩⒪⒫⒬⒭⒮⒯⒰⒱⒲⒳⒴⒵
U+24B6 - U+24CF	CIRCLED LATIN CAPITAL LETTER	丸付きラテン文字	ⒶⒷⒸⒹⒺⒻⒼⒽⒾⒿⓀⓁⓂⓃⓄⓅⓆⓇⓈⓉⓊⓋⓌⓍⓎⓏ
U+24D0 - U+24E9	CIRCLED LATIN CAPITAL SMALL	丸付きラテン文字	ⓐⓑⓒⓓⓔⓕⓖⓗⓘⓙⓚⓛⓜⓝⓞⓟⓠⓡⓢⓣⓤⓥⓦⓧⓨⓩ
U+FF21 - U+FF3A	FULLWIDTH LATIN CAPITAL	全角文字	ＡＢＣＤＥＦＧＨＩＪＫＬＭＮＯＰＱＲＳＴＵＶＷＸＹＺ
U+FF41 - U+FF5A	FULLWIDTH LATIN SMALL	全角文字	ａｂｃｄｅｆｇｈｉｊｋｌｍｎｏｐｑｒｓｔｕｖｗｘｙｚ
U+1D400 - U+1D419	MATHEMATICAL BOLD CAPITAL	数学用	𝐀𝐁𝐂𝐃𝐄𝐅𝐆𝐇𝐈𝐉𝐊𝐋𝐌𝐍𝐎𝐏𝐐𝐑𝐒𝐓𝐔𝐕𝐖𝐗𝐘𝐙
U+1D41A - U+1D433	MATHEMATICAL BOLD SMALL	数学用	𝐚𝐛𝐜𝐝𝐞𝐟𝐠𝐡𝐢𝐣𝐤𝐥𝐦𝐧𝐨𝐩𝐪𝐫𝐬𝐭𝐮𝐯𝐰𝐱𝐲𝐳
U+1D434 - U+1D44D	MATHEMATICAL ITALIC CAPITAL	数学用	𝐴𝐵𝐶𝐷𝐸𝐹𝐺𝐻𝐼𝐽𝐾𝐿𝑀𝑁𝑂𝑃𝑄𝑅𝑆𝑇𝑈𝑉𝑊𝑋𝑌𝑍
U+1D44E - U+1D467	MATHEMATICAL ITALIC SMALL	数学用	𝑎𝑏𝑐𝑑𝑒𝑓𝑔𝑕𝑖𝑗𝑘𝑙𝑚𝑛𝑜𝑝𝑞𝑟𝑠𝑡𝑢𝑣𝑤𝑥𝑦𝑧
U+1D468 - U+1D481	MATHEMATICAL BOLD ITALIC CAPITAL	数学用	𝑨𝑩𝑪𝑫𝑬𝑭𝑮𝑯𝑰𝑱𝑲𝑳𝑴𝑵𝑶𝑷𝑸𝑹𝑺𝑻𝑼𝑽𝑾𝑿𝒀𝒁
U+1D482 - U+1D49B	MATHEMATICAL BOLD ITALIC SMALL	数学用	𝒂𝒃𝒄𝒅𝒆𝒇𝒈𝒉𝒊𝒋𝒌𝒍𝒎𝒏𝒐𝒑𝒒𝒓𝒔𝒕𝒖𝒗𝒘𝒙𝒚𝒛
U+1D49C - U+1D4B5	MATHEMATICAL SCRIPT CAPITAL	数学用	𝒜𝒝𝒞𝒟𝒠𝒡𝒢𝒣𝒤𝒥𝒦𝒧𝒨𝒩𝒪𝒫𝒬𝒭𝒮𝒯𝒰𝒱𝒲𝒳𝒴𝒵
U+1D4B6 - U+1D4CF	MATHEMATICAL SCRIPT SMALL	数学用	𝒶𝒷𝒸𝒹𝒺𝒻𝒼𝒽𝒾𝒿𝓀𝓁𝓂𝓃𝓄𝓅𝓆𝓇𝓈𝓉𝓊𝓋𝓌𝓍𝓎𝓏
U+1D4D0 - U+1D4E9	MATHEMATICAL BOLD SCRIPT CAPITAL	数学用	𝓐𝓑𝓒𝓓𝓔𝓕𝓖𝓗𝓘𝓙𝓚𝓛𝓜𝓝𝓞𝓟𝓠𝓡𝓢𝓣𝓤𝓥𝓦𝓧𝓨𝓩
U+1D4EA - U+1D503	MATHEMATICAL BOLD SCRIPT SMALL	数学用	𝓪𝓫𝓬𝓭𝓮𝓯𝓰𝓱𝓲𝓳𝓴𝓵𝓶𝓷𝓸𝓹𝓺𝓻𝓼𝓽𝓾𝓿𝓿𝔀𝔁𝔂𝔃
U+1D504 - U+1D51D	MATHEMATICAL FRAKTUR CAPITAL	数学用	𝔄𝔅𝔆𝔇𝔈𝔉𝔊𝔋𝔌𝔍𝔎𝔏𝔐𝔑𝔒𝔓𝔔𝔕𝔖𝔗𝔘𝔙𝔚𝔛𝔜𝔝
U+1D51E - U+1D537	MATHEMATICAL FRAKTUR SMALL	数学用	𝔞𝔟𝔠𝔡𝔢𝔣𝔤𝔥𝔦𝔧𝔨𝔩𝔪𝔫𝔬𝔭𝔮𝔯𝔰𝔱𝔲𝔳𝔴𝔵𝔶𝔷
U+1D538 - U+1D551	MATHEMATICAL DOUBLE-STRUCK CAPITAL	数学用	𝔸𝔹𝔺𝔻𝔼𝔽𝔾𝔿𝕀𝕁𝕂𝕃𝕄𝕅𝕆𝕇𝕈𝕉𝕊𝕋𝕌𝕍𝕎𝕏𝕐𝕑
U+1D552 - U+1D56B	MATHEMATICAL DOUBLE-STRUCK SMALL	数学用	𝕒𝕓𝕔𝕕𝕖𝕗𝕘𝕙𝕚𝕛𝕜𝕝𝕞𝕟𝕠𝕡𝕢𝕣𝕤𝕥𝕦𝕧𝕨𝕩𝕪𝕫
U+1D56C - U+1D585	MATHEMATICAL BOLD FRAKTUR CAPITAL	数学用	𝕬𝕭𝕮𝕯𝕰𝕱𝕲𝕳𝕴𝕵𝕶𝕷𝕸𝕹𝕺𝕻𝕼𝕽𝕾𝕿𝖀𝖁𝖂𝖃𝖄𝖅
U+1D586 - U+1D59F	MATHEMATICAL BOLD FRAKTUR SMALL	数学用	𝖆𝖇𝖈𝖉𝖊𝖋𝖌𝖍𝖎𝖏𝖐𝖑𝖒𝖓𝖔𝖕𝖖𝖗𝖘𝖙𝖚𝖛𝖜𝖝𝖞𝖟
U+1D5A0 - U+1D5B9	MATHEMATICAL SANS-SERIF CAPITAL	数学用	𝖠𝖡𝖢𝖣𝖤𝖥𝖦𝖧𝖨𝖩𝖪𝖫𝖬𝖭𝖮𝖯𝖰𝖱𝖲𝖳𝖴𝖵𝖶𝖷𝖸𝖹
U+1D5BA - U+1D5D3	MATHEMATICAL SANS-SERIF SMALL	数学用	𝖺𝖻𝖼𝖽𝖾𝖿𝗀𝗁𝗂𝗃𝗄𝗅𝗆𝗇𝗈𝗉𝗊𝗋𝗌𝗍𝗎𝗏𝗐𝗑𝗒𝗓
U+1D5D4 - U+1D5ED	MATHEMATICAL SANS-SERIF BOLD CAPITAL	数学用	𝗔𝗕𝗖𝗗𝗘𝗙𝗚𝗛𝗜𝗝𝗞𝗟𝗠𝗡𝗢𝗣𝗤𝗥𝗦𝗧𝗨𝗩𝗪𝗫𝗬𝗭
U+1D5EE - U+1D607	MATHEMATICAL SANS-SERIF BOLD SMALL	数学用	𝗮𝗯𝗰𝗱𝗲𝗳𝗴𝗵𝗶𝗷𝗸𝗹𝗺𝗻𝗼𝗽𝗾𝗿𝘀𝘁𝘂𝘃𝘄𝘅𝘆𝘇
U+1D608 - U+1D621	MATHEMATICAL SANS-SERIF ITALIC CAPITAL	数学用	𝘈𝘉𝘊𝘋𝘌𝘍𝘎𝘏𝘐𝘑𝘒𝘓𝘔𝘕𝘖𝘗𝘘𝘙𝘚𝘛𝘜𝘝𝘞𝘟𝘠𝘡
U+1D622 - U+1D63B	MATHEMATICAL SANS-SERIF ITALIC SMALL	数学用	𝘢𝘣𝘤𝘥𝘦𝘧𝘨𝘩𝘪𝘫𝘬𝘭𝘮𝘯𝘰𝘱𝘲𝘳𝘴𝘵𝘶𝘷𝘸𝘹𝘺𝘻
U+1D63C - U+1D655	MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL	数学用	𝘼𝘽𝘾𝘿𝙀𝙁𝙂𝙃𝙄𝙅𝙆𝙇𝙈𝙉𝙊𝙋𝙌𝙍𝙎𝙏𝙐𝙑𝙒𝙓𝙔𝙕
U+1D656 - U+1D66F	MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL	数学用	𝙖𝙗𝙘𝙙𝙚𝙛𝙜𝙝𝙞𝙟𝙠𝙡𝙢𝙣𝙤𝙥𝙦𝙧𝙨𝙩𝙪𝙫𝙬𝙭𝙮𝙯
U+1D670 - U+1D689	MATHEMATICAL MONOSPACE CAPITAL	数学用	𝙰𝙱𝙲𝙳𝙴𝙵𝙶𝙷𝙸𝙹𝙺𝙻𝙼𝙽𝙾𝙿𝚀𝚁𝚂𝚃𝚄𝚅𝚆𝚇𝚈𝚉
U+1D68A - U+1D6A3	MATHEMATICAL MONOSPACE SMALL	数学用	𝚊𝚋𝚌𝚍𝚎𝚏𝚐𝚑𝚒𝚓𝚔𝚕𝚖𝚗𝚘𝚙𝚚𝚛𝚜𝚝𝚞𝚟𝚠𝚡𝚢𝚣
U+1F110 - U+1F129	PARENTHESIZED LATIN CAPITAL LETTER	括弧付きラテン文字	🄐🄑🄒🄓🄔🄕🄖🄗🄘🄙🄚🄛🄜🄝🄞🄟🄠🄡🄢🄣🄤🄥🄦🄧🄨🄩
U+1F130 - U+1F149	SQUARED LATIN CAPITAL LETTER	四角付きラテン文字	🄰🄱🄲🄳🄴🄵🄶🄷🄸🄹🄺🄻🄼🄽🄾🄿🅀🅁🅂🅃🅄🅅🅆🅇🅈🅉
U+1F150 - U+1F169	NEGATIVE CIRCLED LATIN CAPITAL LETTER	白抜き黒丸付きラテン文字	🅐🅑🅒🅓🅔🅕🅖🅗🅘🅙🅚🅛🅜🅝🅞🅟🅠🅡🅢🅣🅤🅥🅦🅧🅨🅩
U+1F170 - U+1F189	NEGATIVE SQUARED LATIN CAPITAL LETTER	白抜き黒四角付きラテン文字	🅰🅱🅲🅳🅴🅵🅶🅷🅸🅹🅺🅻🅼🅽🅾🅿🆀🆁🆂🆃🆄🆅🆆🆇🆈🆉
U+1F1E6 - U+1F1FF	REGIONAL INDICATOR SYMBOL LETTER	地域指示記号	🇦🇧🇨🇩🇪🇫🇬🇭🇮🇯🇰🇱🇲🇳🇴🇵🇶🇷🇸🇹🇺🇻🇼🇽🇾🇿



  FF21@ＡＢＣＤＥＦＧＨＩＪＫＬＭＮＯＰＱＲＳＴＵＶＷＸＹＺａｂｃｄｅｆｇｈｉｊｋｌｍｎｏｐｑｒｓｔｕｖｗｘｙｚ
  1D400@𝐀𝐁𝐂𝐃𝐄𝐅𝐆𝐇𝐈𝐉𝐊𝐋𝐌𝐍𝐎𝐏𝐐𝐑𝐒𝐓𝐔𝐕𝐖𝐗𝐘𝐙𝐚𝐛𝐜𝐝𝐞𝐟𝐠𝐡𝐢𝐣𝐤𝐥𝐦𝐧𝐨𝐩𝐪𝐫𝐬𝐭𝐮𝐯𝐰𝐱𝐲𝐳
  1D434@𝐴𝐵𝐶𝐷𝐸𝐹𝐺𝐻𝐼𝐽𝐾𝐿𝑀𝑁𝑂𝑃𝑄𝑅𝑆𝑇𝑈𝑉𝑊𝑋𝑌𝑍𝑎𝑏𝑐𝑑𝑒𝑓𝑔ℎ𝑖𝑗𝑘𝑙𝑚𝑛𝑜𝑝𝑞𝑟𝑠𝑡𝑢𝑣𝑤𝑥𝑦𝑧
  1D468@𝑨𝑩𝑪𝑫𝑬𝑭𝑮𝑯𝑰𝑱𝑲𝑳𝑴𝑵𝑶𝑷𝑸𝑹𝑺𝑻𝑼𝑽𝑾𝑿𝒀𝒁𝒂𝒃𝒄𝒅𝒆𝒇𝒈𝒉𝒊𝒋𝒌𝒍𝒎𝒏𝒐𝒑𝒒𝒓𝒔𝒕𝒖𝒗𝒘𝒙𝒚𝒛
  1D49C@𝒜ℬ𝒞𝒟ℰℱ𝒢ℋℐ𝒥𝒦ℒℳ𝒩𝒪𝒫𝒬ℛ𝒮𝒯𝒰𝒱𝒲𝒳𝒴𝒵𝒶𝒷𝒸𝒹ℯ𝒻ℊ𝒽𝒾𝒿𝓀𝓁𝓂𝓃ℴ𝓅𝓆𝓇𝓈𝓉𝓊𝓋𝓌𝓍𝓎𝓏
  1D4D0@𝓐𝓑𝓒𝓓𝓔𝓕𝓖𝓗𝓘𝓙𝓚𝓛𝓜𝓝𝓞𝓟𝓠𝓡𝓢𝓣𝓤𝓥𝓦𝓧𝓨𝓩𝓪𝓫𝓬𝓭𝓮𝓯𝓰𝓱𝓲𝓳𝓴𝓵𝓶𝓷𝓸𝓹𝓺𝓻𝓼𝓽𝓾𝓿𝔀𝔁𝔂𝔃
  1D504@𝔄𝔅ℭ𝔇𝔈𝔉𝔊ℌℑ𝔍𝔎𝔏𝔐𝔑𝔒𝔓𝔔ℜ𝔖𝔗𝔘𝔙𝔚𝔛𝔜ℨ𝔞𝔟𝔠𝔡𝔢𝔣𝔤𝔥𝔦𝔧𝔨𝔩𝔪𝔫𝔬𝔭𝔮𝔯𝔰𝔱𝔲𝔳𝔴𝔵𝔶𝔷
  1D538@𝔸𝔹ℂ𝔻𝔼𝔽𝔾ℍ𝕀𝕁𝕂𝕃𝕄ℕ𝕆ℙℚℝ𝕊𝕋𝕌𝕍𝕎𝕏𝕐ℤ𝕒𝕓𝕔𝕕𝕖𝕗𝕘𝕙𝕚𝕛𝕜𝕝𝕞𝕟𝕠𝕡𝕢𝕣𝕤𝕥𝕦𝕧𝕨𝕩𝕪𝕫
  1D56C@𝕬𝕭𝕮𝕯𝕰𝕱𝕲𝕳𝕴𝕵𝕶𝕷𝕸𝕹𝕺𝕻𝕼𝕽𝕾𝕿𝖀𝖁𝖂𝖃𝖄𝖅𝖆𝖇𝖈𝖉𝖊𝖋𝖌𝖍𝖎𝖏𝖐𝖑𝖒𝖓𝖔𝖕𝖖𝖗𝖘𝖙𝖚𝖛𝖜𝖝𝖞𝖟
  1D5A0@𝖠𝖡𝖢𝖣𝖤𝖥𝖦𝖧𝖨𝖩𝖪𝖫𝖬𝖭𝖮𝖯𝖰𝖱𝖲𝖳𝖴𝖵𝖶𝖷𝖸𝖹𝖺𝖻𝖼𝖽𝖾𝖿𝗀𝗁𝗂𝗃𝗄𝗅𝗆𝗇𝗈𝗉𝗊𝗋𝗌𝗍𝗎𝗏𝗐𝗑𝗒𝗓
  1D5D4@𝗔𝗕𝗖𝗗𝗘𝗙𝗚𝗛𝗜𝗝𝗞𝗟𝗠𝗡𝗢𝗣𝗤𝗥𝗦𝗧𝗨𝗩𝗪𝗫𝗬𝗭𝗮𝗯𝗰𝗱𝗲𝗳𝗴𝗵𝗶𝗷𝗸𝗹𝗺𝗻𝗼𝗽𝗾𝗿𝘀𝘁𝘂𝘃𝘄𝘅𝘆𝘇
  1D608@𝘈𝘉𝘊𝘋𝘌𝘍𝘎𝘏𝘐𝘑𝘒𝘓𝘔𝘕𝘖𝘗𝘘𝘙𝘚𝘛𝘜𝘝𝘞𝘟𝘠𝘡𝘢𝘣𝘤𝘥𝘦𝘧𝘨𝘩𝘪𝘫𝘬𝘭𝘮𝘯𝘰𝘱𝘲𝘳𝘴𝘵𝘶𝘷𝘸𝘹𝘺𝘻
  1D63C@𝘼𝘽𝘾𝘿𝙀𝙁𝙂𝙃𝙄𝙅𝙆𝙇𝙈𝙉𝙊𝙋𝙌𝙍𝙎𝙏𝙐𝙑𝙒𝙓𝙔𝙕𝙖𝙗𝙘𝙙𝙚𝙛𝙜𝙝𝙞𝙟𝙠𝙡𝙢𝙣𝙤𝙥𝙦𝙧𝙨𝙩𝙪𝙫𝙬𝙭𝙮𝙯
  1D670@𝙰𝙱𝙲𝙳𝙴𝙵𝙶𝙷𝙸𝙹𝙺𝙻𝙼𝙽𝙾𝙿𝚀𝚁𝚂𝚃𝚄𝚅𝚆𝚇𝚈𝚉𝚊𝚋𝚌𝚍𝚎𝚏𝚐𝚑𝚒𝚓𝚔𝚕𝚖𝚗𝚘𝚙𝚚𝚛𝚜𝚝𝚞𝚟𝚠𝚡𝚢𝚣
  1F110@🄐🄑🄒🄓🄔🄕🄖🄗🄘🄙🄚🄛🄜🄝🄞🄟🄠🄡🄢🄣🄤🄥🄦🄧🄨🄩⒜⒝⒞⒟⒠⒡⒢⒣⒤⒥⒦⒧⒨⒩⒪⒫⒬⒭⒮⒯⒰⒱⒲⒳⒴⒵
  24B6@ⒶⒷⒸⒹⒺⒻⒼⒽⒾⒿⓀⓁⓂⓃⓄⓅⓆⓇⓈⓉⓊⓋⓌⓍⓎⓏⓐⓑⓒⓓⓔⓕⓖⓗⓘⓙⓚⓛⓜⓝⓞⓟⓠⓡⓢⓣⓤⓥⓦⓧⓨⓩ
  1F130@🄰🄱🄲🄳🄴🄵🄶🄷🄸🄹🄺🄻🄼🄽🄾🄿🅀🅁🅂🅃🅄🅅🅆🅇🅈🅉abcdefghijklmnopqrstuvwxyz
  1F150@🅐🅑🅒🅓🅔🅕🅖🅗🅘🅙🅚🅛🅜🅝🅞🅟🅠🅡🅢🅣🅤🅥🅦🅧🅨🅩abcdefghijklmnopqrstuvwxyz
  1F170@🅰🅱🅲🅳🅴🅵🅶🅷🅸🅹🅺🅻🅼🅽🅾🅿🆀🆁🆂🆃🆄🆅🆆🆇🆈🆉abcdefghijklmnopqrstuvwxyz
  1F1E6@🇦🇧🇨🇩🇪🇫🇬🇭🇮🇯🇰🇱🇲🇳🇴🇵🇶🇷🇸🇹🇺🇻🇼🇽🇾🇿abcdefghijklmnopqrstuvwxyz"
(defun uniletter--parse (character)
  "Parse the given ASCII CHARACTER and return its type and reverse index.
Returns a cons cell (N . INDEX), where:
- N is 0 for uppercase and 1 for lowercase.
- INDEX is the character's position from the case group end (0-based)."
  (cl-loop for n in '(0 1)
           for lst = (nth n uniletter-ascii-characters)
           for rest = (memq character lst)
           if rest
           return (cons n (- 26 (length rest)))))

(defun uniletter-convert-region (start end to)
  ""
  (interactive (let ((start (mark)) (end (point)))
                 (unless (and start end)
                   (user-error "The mark is not set now, so there is no region"))
                 (list start end
                       (intern (completing-read "Convert to: " uniletter-letters)))))
  (let* ((string (buffer-substring-no-properties start end))
         (normalized (ucs-normalize-NFKD-string string)))
    (when-let ((convert (uniletter-convert normalized to)))
      (message "convreted %s" convert)
      (delete-region start end)
      (insert convert))))

(defun uniletter-convert (string to)
  ""
  (let ((map (alist-get to uniletter-letters)))
    (concat
     (seq-map
      (lambda (char)
        (if-let (parsed (uniletter--parse char))
          (let ((case (car parsed))
                (idx (cdr parsed)))
            (nth idx (or (nth case map) (nth 0 map))))
          char))
      string))))

;; (uniletter-convert "abc" :ascii)
;; (uniletter-convert "abc" :circled-latin)
;; (uniletter-convert "ABC あいう abc" :circled-latin)

(provide 'uniletter)
;;; uniletter.el ends here
