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
  `((squared-latin-capital
     (?🄰 ?🄱 ?🄲 ?🄳 ?🄴 ?🄵 ?🄶 ?🄷 ?🄸 ?🄹 ?🄺 ?🄻 ?🄼 ?🄽 ?🄾 ?🄿 ?🅀 ?🅁 ?🅂 ?🅃 ?🅄 ?🅅 ?🅆 ?🅇 ?🅈 ?🅉))
    (regional-indicator-symbol
     (?🇦 ?🇧 ?🇨 ?🇩 ?🇪 ?🇫 ?🇬 ?🇭 ?🇮 ?🇯 ?🇰 ?🇱 ?🇲 ?🇳 ?🇴 ?🇵 ?🇶 ?🇷 ?🇸 ?🇹 ?🇺 ?🇻 ?🇼 ?🇽 ?🇾 ?🇿))
    (parenthesized-latin
     (?🄐 ?🄑 ?🄒 ?🄓 ?🄔 ?🄕 ?🄖 ?🄗 ?🄘 ?🄙 ?🄚 ?🄛 ?🄜 ?🄝 ?🄞 ?🄟 ?🄠 ?🄡 ?🄢 ?🄣 ?🄤 ?🄥 ?🄦 ?🄧 ?🄨 ?🄩)
     (?⒜ ?⒝ ?⒞ ?⒟ ?⒠ ?⒡ ?⒢ ?⒣ ?⒤ ?⒥ ?⒦ ?⒧ ?⒨ ?⒩ ?⒪ ?⒫ ?⒬ ?⒭ ?⒮ ?⒯ ?⒰ ?⒱ ?⒲ ?⒳ ?⒴ ?⒵))
    (negative-circled-latin-capital
     (?🅐 ?🅑 ?🅒 ?🅓 ?🅔 ?🅕 ?🅖 ?🅗 ?🅘 ?🅙 ?🅚 ?🅛 ?🅜 ?🅝 ?🅞 ?🅟 ?🅠 ?🅡 ?🅢 ?🅣 ?🅤 ?🅥 ?🅦 ?🅧 ?🅨 ?🅩))
    (negative-squared-latin-capital
     (?🅰 ?🅱 ?🅲 ?🅳 ?🅴 ?🅵 ?🅶 ?🅷 ?🅸 ?🅹 ?🅺 ?🅻 ?🅼 ?🅽 ?🅾 ?🅿 ?🆀 ?🆁 ?🆂 ?🆃 ?🆄 ?🆅 ?🆆 ?🆇 ?🆈 ?🆉))
    (math-script
     (?𝒜 ?ℬ ?𝒞 ?𝒟 ?ℰ ?ℱ ?𝒢 ?ℋ ?ℐ ?𝒥 ?𝒦 ?ℒ ?ℳ ?𝒩 ?𝒪 ?𝒫 ?𝒬 ?ℛ ?𝒮 ?𝒯 ?𝒰 ?𝒱 ?𝒲 ?𝒳 ?𝒴 ?𝒵)
     (?𝒶 ?𝒷 ?𝒸 ?𝒹 ?g ?𝒻 ?ℊ ?𝒽 ?𝒾 ?𝒿 ?𝓀 ?𝓁 ?𝓂 ?𝓃 ?ℴ ?𝓅 ?𝓆 ?𝓇 ?𝓈 ?𝓉 ?𝓊 ?𝓋 ?𝓌 ?𝓍 ?𝓎 ?𝓏))
    (math-sans-serif-italic-bold
     (?𝘼 ?𝘽 ?𝘾 ?𝘿 ?𝙀 ?𝙁 ?𝙂 ?𝙃 ?𝙄 ?𝙅 ?𝙆 ?𝙇 ?𝙈 ?𝙉 ?𝙊 ?𝙋 ?𝙌 ?𝙍 ?𝙎 ?𝙏 ?𝙐 ?𝙑 ?𝙒 ?𝙓 ?𝙔 ?𝙕)
     (?𝙖 ?𝙗 ?𝙘 ?𝙙 ?𝙚 ?𝙛 ?𝙜 ?𝙝 ?𝙞 ?𝙟 ?𝙠 ?𝙡 ?𝙢 ?𝙣 ?𝙤 ?𝙥 ?𝙦 ?𝙧 ?𝙨 ?𝙩 ?𝙪 ?𝙫 ?𝙬 ?𝙭 ?𝙮 ?𝙯))
    (math-sans-serif-italic
     (?𝘈 ?𝘉 ?𝘊 ?𝘋 ?𝘌 ?𝘍 ?𝘎 ?𝘏 ?𝘐 ?𝘑 ?𝘒 ?𝘓 ?𝘔 ?𝘕 ?𝘖 ?𝘗 ?𝘘 ?𝘙 ?𝘚 ?𝘛 ?𝘜 ?𝘝 ?𝘞 ?𝘟 ?𝘠 ?𝘡)
     (?𝘢 ?𝘣 ?𝘤 ?𝘥 ?𝘦 ?𝘧 ?𝘨 ?𝘩 ?𝘪 ?𝘫 ?𝘬 ?𝘭 ?𝘮 ?𝘯 ?𝘰 ?𝘱 ?𝘲 ?𝘳 ?𝘴 ?𝘵 ?𝘶 ?𝘷 ?𝘸 ?𝘹 ?𝘺 ?𝘻))
    (math-sans-serif-bold
     (?𝗔 ?𝗕 ?𝗖 ?𝗗 ?𝗘 ?𝗙 ?𝗚 ?𝗛 ?𝗜 ?𝗝 ?𝗞 ?𝗟 ?𝗠 ?𝗡 ?𝗢 ?𝗣 ?𝗤 ?𝗥 ?𝗦 ?𝗧 ?𝗨 ?𝗩 ?𝗪 ?𝗫 ?𝗬 ?𝗭)
     (?𝗮 ?𝗯 ?𝗰 ?𝗱 ?𝗲 ?𝗳 ?𝗴 ?𝗵 ?𝗶 ?𝗷 ?𝗸 ?𝗹 ?𝗺 ?𝗻 ?𝗼 ?𝗽 ?𝗾 ?𝗿 ?𝘀 ?𝘁 ?𝘂 ?𝘃 ?𝘄 ?𝘅 ?𝘆 ?𝘇))
    (math-sans-serif
     (?𝖠 ?𝖡 ?𝖢 ?𝖣 ?𝖤 ?𝖥 ?𝖦 ?𝖧 ?𝖨 ?𝖩 ?𝖪 ?𝖫 ?𝖬 ?𝖭 ?𝖮 ?𝖯 ?𝖰 ?𝖱 ?𝖲 ?𝖳 ?𝖴 ?𝖵 ?𝖶 ?𝖷 ?𝖸 ?𝖹)
     (?𝖺 ?𝖻 ?𝖼 ?𝖽 ?𝖾 ?𝖿 ?𝗀 ?𝗁 ?𝗂 ?𝗃 ?𝗄 ?𝗅 ?𝗆 ?𝗇 ?𝗈 ?𝗉 ?𝗊 ?𝗋 ?𝗌 ?𝗍 ?𝗎 ?𝗏 ?𝗐 ?𝗑 ?𝗒 ?𝗓))
    (math-monospace
     (?𝙰 ?𝙱 ?𝙲 ?𝙳 ?𝙴 ?𝙵 ?𝙶 ?𝙷 ?𝙸 ?𝙹 ?𝙺 ?𝙻 ?𝙼 ?𝙽 ?𝙾 ?𝙿 ?𝚀 ?𝚁 ?𝚂 ?𝚃 ?𝚄 ?𝚅 ?𝚆 ?𝚇 ?𝚈 ?𝚉)
     (?𝚊 ?𝚋 ?𝚌 ?𝚍 ?𝚎 ?𝚏 ?𝚐 ?𝚑 ?𝚒 ?𝚓 ?𝚔 ?𝚕 ?𝚖 ?𝚗 ?𝚘 ?𝚙 ?𝚚 ?𝚛 ?𝚜 ?𝚝 ?𝚞 ?𝚟 ?𝚠 ?𝚡 ?𝚢 ?𝚣))
    (math-italic
     (?𝐴 ?𝐵 ?𝐶 ?𝐷 ?𝐸 ?𝐹 ?𝐺 ?𝐻 ?𝐼 ?𝐽 ?𝐾 ?𝐿 ?𝑀 ?𝑁 ?𝑂 ?𝑃 ?𝑄 ?𝑅 ?𝑆 ?𝑇 ?𝑈 ?𝑉 ?𝑊 ?𝑋 ?𝑌 ?𝑍)
     (?𝑎 ?𝑏 ?𝑐 ?𝑑 ?𝑒 ?𝑓 ?𝑔 ?ℎ ?𝑖 ?𝑗 ?𝑘 ?𝑙 ?𝑚 ?𝑛 ?𝑜 ?𝑝 ?𝑞 ?𝑟 ?𝑠 ?𝑡 ?𝑢 ?𝑣 ?𝑤 ?𝑥 ?𝑦 ?𝑧))
    (math-double-struck
     (?𝔸 ?𝔹 ?ℂ ?𝔻 ?𝔼 ?𝔽 ?𝔾 ?ℍ ?𝕀 ?𝕁 ?𝕂 ?𝕃 ?𝕄 ?ℕ ?𝕆 ?ℙ ?ℚ ?ℝ ?𝕊 ?𝕋 ?𝕌 ?𝕍 ?𝕎 ?𝕏 ?𝕐 ?ℤ)
     (?𝕒 ?𝕓 ?𝕔 ?𝕕 ?𝕖 ?𝕗 ?𝕘 ?𝕙 ?𝕚 ?𝕛 ?𝕜 ?𝕝 ?𝕞 ?𝕟 ?𝕠 ?𝕡 ?𝕢 ?𝕣 ?𝕤 ?𝕥 ?𝕦 ?𝕧 ?𝕨 ?𝕩 ?𝕪 ?𝕫))
    (math-fraktur
     (?𝔄 ?𝔅 ?ℭ ?𝔇 ?𝔈 ?𝔉 ?𝔊 ?ℌ ?ℑ ?𝔍 ?𝔎 ?𝔏 ?𝔐 ?𝔑 ?𝔒 ?𝔓 ?𝔔 ?ℜ ?𝔖 ?𝔗 ?𝔘 ?𝔙 ?𝔚 ?𝔛 ?𝔜 ?ℨ)
     (?𝔞 ?𝔟 ?𝔠 ?𝔡 ?𝔢 ?𝔣 ?𝔤 ?𝔥 ?𝔦 ?𝔧 ?𝔨 ?𝔩 ?𝔪 ?𝔫 ?𝔬 ?𝔭 ?𝔮 ?𝔯 ?𝔰 ?𝔱 ?𝔲 ?𝔳 ?𝔴 ?𝔵 ?𝔶 ?𝔷))
    (math-bold-script
     (?𝓐 ?𝓑 ?𝓒 ?𝓓 ?𝓔 ?𝓕 ?𝓖 ?𝓗 ?𝓘 ?𝓙 ?𝓚 ?𝓛 ?𝓜 ?𝓝 ?𝓞 ?𝓟 ?𝓠 ?𝓡 ?𝓢 ?𝓣 ?𝓤 ?𝓥 ?𝓦 ?𝓧 ?𝓨 ?𝓩)
     (?𝓪 ?𝓫 ?𝓬 ?𝓭 ?𝓮 ?𝓯 ?𝓰 ?𝓱 ?𝓲 ?𝓳 ?𝓴 ?𝓵 ?𝓶 ?𝓷 ?𝓸 ?𝓹 ?𝓺 ?𝓻 ?𝓼 ?𝓽 ?𝓾 ?𝓿 ?𝓿 ?𝔀 ?𝔁 ?𝔂 ?𝔃))
    (math-bold-fraktur
     (?𝕬 ?𝕭 ?𝕮 ?𝕯 ?𝕰 ?𝕱 ?𝕲 ?𝕳 ?𝕴 ?𝕵 ?𝕶 ?𝕷 ?𝕸 ?𝕹 ?𝕺 ?𝕻 ?𝕼 ?𝕽 ?𝕾 ?𝕿 ?𝖀 ?𝖁 ?𝖂 ?𝖃 ?𝖄 ?𝖅)
     (?𝖆 ?𝖇 ?𝖈 ?𝖉 ?𝖊 ?𝖋 ?𝖌 ?𝖍 ?𝖎 ?𝖏 ?𝖐 ?𝖑 ?𝖒 ?𝖓 ?𝖔 ?𝖕 ?𝖖 ?𝖗 ?𝖘 ?𝖙 ?𝖚 ?𝖛 ?𝖜 ?𝖝 ?𝖞 ?𝖟))
    (math-bold-italic
     (?𝑨 ?𝑩 ?𝑪 ?𝑫 ?𝑬 ?𝑭 ?𝑮 ?𝑯 ?𝑰 ?𝑱 ?𝑲 ?𝑳 ?𝑴 ?𝑵 ?𝑶 ?𝑷 ?𝑸 ?𝑹 ?𝑺 ?𝑻 ?𝑼 ?𝑽 ?𝑾 ?𝑿 ?𝒀 ?𝒁)
     (?𝒂 ?𝒃 ?𝒄 ?𝒅 ?𝒆 ?𝒇 ?𝒈 ?𝒉 ?𝒊 ?𝒋 ?𝒌 ?𝒍 ?𝒎 ?𝒏 ?𝒐 ?𝒑 ?𝒒 ?𝒓 ?𝒔 ?𝒕 ?𝒖 ?𝒗 ?𝒘 ?𝒙 ?𝒚 ?𝒛))
    (math-bold
     (?𝐀 ?𝐁 ?𝐂 ?𝐃 ?𝐄 ?𝐅 ?𝐆 ?𝐇 ?𝐈 ?𝐉 ?𝐊 ?𝐋 ?𝐌 ?𝐍 ?𝐎 ?𝐏 ?𝐐 ?𝐑 ?𝐒 ?𝐓 ?𝐔 ?𝐕 ?𝐖 ?𝐗 ?𝐘 ?𝐙)
     (?𝐚 ?𝐛 ?𝐜 ?𝐝 ?𝐞 ?𝐟 ?𝐠 ?𝐡 ?𝐢 ?𝐣 ?𝐤 ?𝐥 ?𝐦 ?𝐧 ?𝐨 ?𝐩 ?𝐪 ?𝐫 ?𝐬 ?𝐭 ?𝐮 ?𝐯 ?𝐰 ?𝐱 ?𝐲 ?𝐳))
    (full-width
     (?Ａ ?Ｂ ?Ｃ ?Ｄ ?Ｅ ?Ｆ ?Ｇ ?Ｈ ?Ｉ ?Ｊ ?Ｋ ?Ｌ ?Ｍ ?Ｎ ?Ｏ ?Ｐ ?Ｑ ?Ｒ ?Ｓ ?Ｔ ?Ｕ ?Ｖ ?Ｗ ?Ｘ ?Ｙ ?Ｚ)
     (?ａ ?ｂ ?ｃ ?ｄ ?ｅ ?ｆ ?ｇ ?ｈ ?ｉ ?ｊ ?ｋ ?ｌ ?ｍ ?ｎ ?ｏ ?ｐ ?ｑ ?ｒ ?ｓ ?ｔ ?ｕ ?ｖ ?ｗ ?ｘ ?ｙ ?ｚ))
    (circled-latin
     (?Ⓐ ?Ⓑ ?Ⓒ ?Ⓓ ?Ⓔ ?Ⓕ ?Ⓖ ?Ⓗ ?Ⓘ ?Ⓙ ?Ⓚ ?Ⓛ ?Ⓜ ?Ⓝ ?Ⓞ ?Ⓟ ?Ⓠ ?Ⓡ ?Ⓢ ?Ⓣ ?Ⓤ ?Ⓥ ?Ⓦ ?Ⓧ ?Ⓨ ?Ⓩ)
     (?ⓐ ?ⓑ ?ⓒ ?ⓓ ?ⓔ ?ⓕ ?ⓖ ?ⓗ ?ⓘ ?ⓙ ?ⓚ ?ⓛ ?ⓜ ?ⓝ ?ⓞ ?ⓟ ?ⓠ ?ⓡ ?ⓢ ?ⓣ ?ⓤ ?ⓥ ?ⓦ ?ⓧ ?ⓨ ?ⓩ))
    (ascii ,@uniletter-ascii-characters)))

;; (defvar uniletter-keymap
;;   (eval-when-compile
;;     (let ((map (make-keymap)))
;;       ())))

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

(defun uniletter-copy-converted-text (string to)
  "Copy the converted representation of STRING to the kill ring.
TO is a key from the `uniletter-letters` alist, which defines various
typographical styles, such as squared Latin capitals, regional indicator
symbols, or mathematical script styles.  This function first normalizes STRING
using NFKD, then converts it according to TO.  The result is placed in the kill
ring and a message is displayed with the converted text."
  (interactive (let* ((start (mark)) (end (point))
                      (string (read-string "Input text: "
                                           (when (region-active-p)
                                             (buffer-substring-no-properties start end)))))
                 (list (ucs-normalize-NFKD-string string)
                       (intern (completing-read "Convert to: " uniletter-letters)))))
  (when-let ((converted (uniletter-convert string to)))
    (kill-new converted)
    (message "convreted %s" converted)))

(defun uniletter-convert (string to)
  ""
  (let ((map (alist-get to uniletter-letters)))
    (unless map
      (user-error "`%s' is invalid name for uniletter" to))
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
;; (uniletter-convert "ABC あいう abc" :math-double-struck)

(provide 'uniletter)
;;; uniletter.el ends here
