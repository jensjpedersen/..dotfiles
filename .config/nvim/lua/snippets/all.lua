return {
    s("choice", { c(1, { t "choice 1", t "choice 2", t "choice 3" }) }),
    s("trigger", {
        t({"After expanding, the cursor is here ->"}), i(1),
        t({"", "After jumping forward once, cursor is here ->"}), i(2),
        t({"", "After jumping once more, the snippet is exited there ->"}), i(0),
    }),

    -- Date snippet
    s("date", {
        t({"Date: "}), f(function(args)
            return os.date("%Y-%m-%d")
        end, {}),
    }),
    -- s({trig="hei"}, {name="print hei"}, { t({"This is some text"}), i(1) }), 
    s({ trig = "hei" }, { name = "print hei" }, {
        t({ "print hei" }),
        i(1)
    }),

    s({trig="al", wordTrig=false}, { t({"This is some text"}), i(0) }), 


    -- format snippet 
    s("snipf", fmt([[ 
        <>({ trig='<>', name='<>'},
        fmt(<>,
        { <> },
        { delimiters='<>' }
        )<>)<>,]],
        { c(1, {t("s"), t("autosnippet")}), i(2, "trig"), i(3, "trig"), i(4, "fmt"), i(5, "inputs"), i(6, "<>"), i(7, "opts"), i(0)},
        { delimiters='<>' }
        )),

    -- simple text snippet 
    s("snipt", fmt([[ 
        <>(<>, {t('<>')}) <>
        ]],
        { c(1, {t("s"), t("autosnippet")}), c(2, {i(nil, "trig"), sn(nil, {t("{trig='"), i(1), t("'}")})}), i(3, "text"),  i(0)},
        { delimiters='<>' }
        )),





    -- s({ trig = "snip", name = "snippet template" }, fmt([[
    --     s({ trig = "{}", name = "{}" }, fmt([[
    --        {}
    --     ]], { {} })) {}
    -- ]], { i(1), i(2), i(3), i(0) })), 



}
