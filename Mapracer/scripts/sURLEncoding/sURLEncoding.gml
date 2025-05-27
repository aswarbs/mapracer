function url_encode(str)
{
    var encoded = "";
    var i, ch, code, hex;

    for (i = 1; i <= string_length(str); i++)
    {
        ch = string_char_at(str, i);
        code = ord(ch);

        if ((code >= 48 && code <= 57) ||     // 0-9
            (code >= 65 && code <= 90) ||     // A-Z
            (code >= 97 && code <= 122) ||    // a-z
            ch == "-" || ch == "_" || ch == "." || ch == "~")
        { 
            encoded += ch;
        }
        else if (ch == " ")
        {
            encoded += "+";
        }
        else
        {
            hex = string_format("%" + string_upper(dec_to_hex(code)), 2, 0);
            encoded += hex;
        }
    }

    return encoded;
}

function dec_to_hex(value)
{
    var hex_digits = "0123456789ABCDEF";
    var hi = value div 16;
    var lo = value mod 16;
    return string_char_at(hex_digits, hi + 1) + string_char_at(hex_digits, lo + 1);
}
