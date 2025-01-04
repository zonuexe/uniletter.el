# uniletter.el

Help to input Unicode letters.

> [!CAUTION]
> While these characters are frequently encountered on social media, their use in non-mathematical contexts should be avoided.
>
> [PDUTR #27: Unicode 3.1](https://www.unicode.org/reports/tr27/tr27-1.html) says follows:
>> The alphabets in this block encode only semantic distinction, but not which specific font will be used to supply the actual plain, script, Fraktur, double-struck, sans-serif, or monospace glyphs. Especially the script and double-struck styles can show considerable variation across fonts. Characters from the Mathematical Alphanumeric Symbols block are not to be used for nonmathematical styled text.

## Commands

### `M-x uniletter-copy-converted-text`

### `M-x uniletter-convert-region`

## Functions

### `(defun uniletter-convert (string to))`

## Supported characters

Currently, this package only supports the 26 letters (A to Z) used in English, known as the [ISO basic Latin alphabet](https://en.wikipedia.org/wiki/ISO_basic_Latin_alphabet).  It is possible to extend these implementations to numbers and Greek letters, but I haven't needed that yet so I haven't implemented it yet.

### Latin alphabet (A to Z)

| Codepoint           | Unicode Name                                | Symbol                            |                                                      |
|---------------------|---------------------------------------------|-----------------------------------|------------------------------------------------------|
| `U+0041 - U+005A`   | LATIN CAPITAL LETTER                        | `'ascii`                          | ABCDEFGHIJKLMNOPQRSTUVWXYZ                           |
| `U+0061 - U+007A`   | LATIN SMALL LETTER                          | `'ascii`                          | abcdefghijklmnopqrstuvwxyz                           |
| `U+1D00 - U+1D7F`   | LATIN LETTER SMALL CAPITAL                  | `'small-capital`                  | ᴀʙᴄᴅᴇꜰɢʜɪᴊᴋʟᴍɴᴏᴘꞯʀꜱᴛᴜᴠᴡ ʏᴢ                           |
| `U+249C - U+24B5`   | PARENTHESIZED LATIN SMALL LETTER            | `'parenthesized-latin`            | ⒜⒝⒞⒟⒠⒡⒢⒣⒤⒥⒦⒧⒨⒩⒪⒫⒬⒭⒮⒯⒰⒱⒲⒳⒴⒵ |
| `U+24B6 - U+24CF`   | CIRCLED LATIN CAPITAL LETTER                | `'circled-latin`                  | ⒶⒷⒸⒹⒺⒻⒼⒽⒾⒿⓀⓁⓂⓃⓄⓅⓆⓇⓈⓉⓊⓋⓌⓍⓎⓏ |
| `U+24D0 - U+24E9`   | CIRCLED LATIN CAPITAL SMALL                 | `'circled-latin`                  | ⓐⓑⓒⓓⓔⓕⓖⓗⓘⓙⓚⓛⓜⓝⓞⓟⓠⓡⓢⓣⓤⓥⓦⓧⓨⓩ |
| `U+FF21 - U+FF3A`   | FULLWIDTH LATIN CAPITAL                     | `'full-width`                     | ＡＢＣＤＥＦＧＨＩＪＫＬＭＮＯＰＱＲＳＴＵＶＷＸＹＺ |
| `U+FF41 - U+FF5A`   | FULLWIDTH LATIN SMALL                       | `'full-width`                     | ａｂｃｄｅｆｇｈｉｊｋｌｍｎｏｐｑｒｓｔｕｖｗｘｙｚ |
| `U+1D400 - U+1D419` | MATHEMATICAL BOLD CAPITAL                   | `'math-bold`                      | 𝐀𝐁𝐂𝐃𝐄𝐅𝐆𝐇𝐈𝐉𝐊𝐋𝐌𝐍𝐎𝐏𝐐𝐑𝐒𝐓𝐔𝐕𝐖𝐗𝐘𝐙                           |
| `U+1D41A - U+1D433` | MATHEMATICAL BOLD SMALL                     | `'math-bold`                      | 𝐚𝐛𝐜𝐝𝐞𝐟𝐠𝐡𝐢𝐣𝐤𝐥𝐦𝐧𝐨𝐩𝐪𝐫𝐬𝐭𝐮𝐯𝐰𝐱𝐲𝐳                           |
| `U+1D434 - U+1D44D` | MATHEMATICAL ITALIC CAPITAL                 | `'math-italic`                    | 𝐴𝐵𝐶𝐷𝐸𝐹𝐺𝐻𝐼𝐽𝐾𝐿𝑀𝑁𝑂𝑃𝑄𝑅𝑆𝑇𝑈𝑉𝑊𝑋𝑌𝑍                           |
| `U+1D44E - U+1D467` | MATHEMATICAL ITALIC SMALL                   | `'math-italic`                    | 𝑎𝑏𝑐𝑑𝑒𝑓𝑔 𝑖𝑗𝑘𝑙𝑚𝑛𝑜𝑝𝑞𝑟𝑠𝑡𝑢𝑣𝑤𝑥𝑦𝑧                           |
| `U+1D468 - U+1D481` | MATHEMATICAL BOLD ITALIC CAPITAL            | `'math-bold-italic`               | 𝑨𝑩𝑪𝑫𝑬𝑭𝑮𝑯𝑰𝑱𝑲𝑳𝑴𝑵𝑶𝑷𝑸𝑹𝑺𝑻𝑼𝑽𝑾𝑿𝒀𝒁                           |
| `U+1D482 - U+1D49B` | MATHEMATICAL BOLD ITALIC SMALL              | `'math-bold-italic`               | 𝒂𝒃𝒄𝒅𝒆𝒇𝒈𝒉𝒊𝒋𝒌𝒍𝒎𝒏𝒐𝒑𝒒𝒓𝒔𝒕𝒖𝒗𝒘𝒙𝒚𝒛                           |
| `U+1D49C - U+1D4B5` | MATHEMATICAL SCRIPT CAPITAL                 | `'math-script`                    | 𝒜 𝒞𝒟 𝒢 𝒥𝒦 𝒩𝒪𝒫𝒬 𝒮𝒯𝒰𝒱𝒲𝒳𝒴𝒵                              |
| `U+1D4B6 - U+1D4CF` | MATHEMATICAL SCRIPT SMALL                   | `'math-script`                    | 𝒶𝒷𝒸𝒹 𝒻 𝒽𝒾𝒿𝓀𝓁𝓂𝓃 𝓅𝓆𝓇𝓈𝓉𝓊𝓋𝓌𝓍𝓎𝓏                           |
| `U+1D4D0 - U+1D4E9` | MATHEMATICAL BOLD SCRIPT CAPITAL            | `'math-bold-script`               | 𝓐𝓑𝓒𝓓𝓔𝓕𝓖𝓗𝓘𝓙𝓚𝓛𝓜𝓝𝓞𝓟𝓠𝓡𝓢𝓣𝓤𝓥𝓦𝓧𝓨𝓩                           |
| `U+1D4EA - U+1D503` | MATHEMATICAL BOLD SCRIPT SMALL              | `'math-bold-script`               | 𝓪𝓫𝓬𝓭𝓮𝓯𝓰𝓱𝓲𝓳𝓴𝓵𝓶𝓷𝓸𝓹𝓺𝓻𝓼𝓽𝓾𝓿𝓿𝔀𝔁𝔂𝔃                          |
| `U+1D504 - U+1D51D` | MATHEMATICAL FRAKTUR CAPITAL                | `'math-fraktur`                   | 𝔄𝔅 𝔇𝔈𝔉𝔊 𝔍𝔎𝔏𝔐𝔑𝔒𝔓𝔔 𝔖𝔗𝔘𝔙𝔚𝔛𝔜                             |
| `U+1D51E - U+1D537` | MATHEMATICAL FRAKTUR SMALL                  | `'math-fraktur`                   | 𝔞𝔟𝔠𝔡𝔢𝔣𝔤𝔥𝔦𝔧𝔨𝔩𝔪𝔫𝔬𝔭𝔮𝔯𝔰𝔱𝔲𝔳𝔴𝔵𝔶𝔷                           |
| `U+1D538 - U+1D551` | MATHEMATICAL DOUBLE-STRUCK CAPITAL          | `'math-double-struck`             | 𝔸𝔹 𝔻𝔼𝔽𝔾 𝕀𝕁𝕂𝕃𝕄 𝕆 𝕊𝕋𝕌𝕍𝕎𝕏𝕐                              |
| `U+1D552 - U+1D56B` | MATHEMATICAL DOUBLE-STRUCK SMALL            | `'math-double-struck`             | 𝕒𝕓𝕔𝕕𝕖𝕗𝕘𝕙𝕚𝕛𝕜𝕝𝕞𝕟𝕠𝕡𝕢𝕣𝕤𝕥𝕦𝕧𝕨𝕩𝕪𝕫                           |
| `U+1D56C - U+1D585` | MATHEMATICAL BOLD FRAKTUR CAPITAL           | `'math-bold-fraktur`              | 𝕬𝕭𝕮𝕯𝕰𝕱𝕲𝕳𝕴𝕵𝕶𝕷𝕸𝕹𝕺𝕻𝕼𝕽𝕾𝕿𝖀𝖁𝖂𝖃𝖄𝖅                           |
| `U+1D586 - U+1D59F` | MATHEMATICAL BOLD FRAKTUR SMALL             | `'math-bold-fraktur`              | 𝖆𝖇𝖈𝖉𝖊𝖋𝖌𝖍𝖎𝖏𝖐𝖑𝖒𝖓𝖔𝖕𝖖𝖗𝖘𝖙𝖚𝖛𝖜𝖝𝖞𝖟                           |
| `U+1D5A0 - U+1D5B9` | MATHEMATICAL SANS-SERIF CAPITAL             | `'math-sans-serif`                | 𝖠𝖡𝖢𝖣𝖤𝖥𝖦𝖧𝖨𝖩𝖪𝖫𝖬𝖭𝖮𝖯𝖰𝖱𝖲𝖳𝖴𝖵𝖶𝖷𝖸𝖹                           |
| `U+1D5BA - U+1D5D3` | MATHEMATICAL SANS-SERIF SMALL               | `'math-sans-serif`                | 𝖺𝖻𝖼𝖽𝖾𝖿𝗀𝗁𝗂𝗃𝗄𝗅𝗆𝗇𝗈𝗉𝗊𝗋𝗌𝗍𝗎𝗏𝗐𝗑𝗒𝗓                           |
| `U+1D5D4 - U+1D5ED` | MATHEMATICAL SANS-SERIF BOLD CAPITAL        | `'math-sans-serif-bold`           | 𝗔𝗕𝗖𝗗𝗘𝗙𝗚𝗛𝗜𝗝𝗞𝗟𝗠𝗡𝗢𝗣𝗤𝗥𝗦𝗧𝗨𝗩𝗪𝗫𝗬𝗭                           |
| `U+1D5EE - U+1D607` | MATHEMATICAL SANS-SERIF BOLD SMALL          | `'math-sans-serif-bold`           | 𝗮𝗯𝗰𝗱𝗲𝗳𝗴𝗵𝗶𝗷𝗸𝗹𝗺𝗻𝗼𝗽𝗾𝗿𝘀𝘁𝘂𝘃𝘄𝘅𝘆𝘇                           |
| `U+1D608 - U+1D621` | MATHEMATICAL SANS-SERIF ITALIC CAPITAL      | `'math-sans-serif-italic`         | 𝘈𝘉𝘊𝘋𝘌𝘍𝘎𝘏𝘐𝘑𝘒𝘓𝘔𝘕𝘖𝘗𝘘𝘙𝘚𝘛𝘜𝘝𝘞𝘟𝘠𝘡                           |
| `U+1D622 - U+1D63B` | MATHEMATICAL SANS-SERIF ITALIC SMALL        | `'math-sans-serif-italic`         | 𝘢𝘣𝘤𝘥𝘦𝘧𝘨𝘩𝘪𝘫𝘬𝘭𝘮𝘯𝘰𝘱𝘲𝘳𝘴𝘵𝘶𝘷𝘸𝘹𝘺𝘻                           |
| `U+1D63C - U+1D655` | MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL | `'math-sans-serif-italic-bold`    | 𝘼𝘽𝘾𝘿𝙀𝙁𝙂𝙃𝙄𝙅𝙆𝙇𝙈𝙉𝙊𝙋𝙌𝙍𝙎𝙏𝙐𝙑𝙒𝙓𝙔𝙕                           |
| `U+1D656 - U+1D66F` | MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL   | `'math-sans-serif-italic-bold`    | 𝙖𝙗𝙘𝙙𝙚𝙛𝙜𝙝𝙞𝙟𝙠𝙡𝙢𝙣𝙤𝙥𝙦𝙧𝙨𝙩𝙪𝙫𝙬𝙭𝙮𝙯                           |
| `U+1D670 - U+1D689` | MATHEMATICAL MONOSPACE CAPITAL              | `'math-monospace`                 | 𝙰𝙱𝙲𝙳𝙴𝙵𝙶𝙷𝙸𝙹𝙺𝙻𝙼𝙽𝙾𝙿𝚀𝚁𝚂𝚃𝚄𝚅𝚆𝚇𝚈𝚉                           |
| `U+1D68A - U+1D6A3` | MATHEMATICAL MONOSPACE SMALL                | `'math-monospace`                 | 𝚊𝚋𝚌𝚍𝚎𝚏𝚐𝚑𝚒𝚓𝚔𝚕𝚖𝚗𝚘𝚙𝚚𝚛𝚜𝚝𝚞𝚟𝚠𝚡𝚢𝚣                           |
| `U+1F110 - U+1F129` | PARENTHESIZED LATIN CAPITAL LETTER          | `'parenthesized-latin`            | 🄐🄑🄒🄓🄔🄕🄖🄗🄘🄙🄚🄛🄜🄝🄞🄟🄠🄡🄢🄣🄤🄥🄦🄧🄨🄩                           |
| `U+1F130 - U+1F149` | SQUARED LATIN CAPITAL LETTER                | `'squared-latin-capital`          | 🄰🄱🄲🄳🄴🄵🄶🄷🄸🄹🄺🄻🄼🄽🄾🄿🅀🅁🅂🅃🅄🅅🅆🅇🅈🅉                           |
| `U+1F150 - U+1F169` | NEGATIVE CIRCLED LATIN CAPITAL LETTER       | `'negative-circled-latin-capital` | 🅐🅑🅒🅓🅔🅕🅖🅗🅘🅙🅚🅛🅜🅝🅞🅟🅠🅡🅢🅣🅤🅥🅦🅧🅨🅩                           |
| `U+1F170 - U+1F189` | NEGATIVE SQUARED LATIN CAPITAL LETTER       | `'negative-squared-latin-capital` | 🅰🅱🅲🅳🅴🅵🅶🅷🅸🅹🅺🅻🅼🅽🅾🅿🆀🆁🆂🆃🆄🆅🆆🆇🆈🆉                           |
| `U+1F1E6 - U+1F1FF` | REGIONAL INDICATOR SYMBOL LETTER            | `'regional-indicator-symbol`      | 🄰 🄱 🄲 🄳 🄴 🄵 🄶 🄷 🄸 🄹 🄺 🄻 🄼 🄽 🄾 🄿 🅀 🅁 🅂 🅃 🅄 🅅 🅆 🅇 🅈 🅉  |

## Copyright

This package is licensed under [GNU General Public License, version 3](https://www.gnu.org/licenses/gpl-3.0).

    uniletter.el  Copyright (C) 2024  USAMI Kenta

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.
