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

}
