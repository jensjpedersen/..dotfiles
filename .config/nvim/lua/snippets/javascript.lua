
return {
    s({ trig='co', name='Console log'}, fmt([[
    console.log({});
    ]],
    { i(0) }
    )),

    s({ trig='pr', name='Console log template string'}, fmt([[
    console.log(`{}`);
    ]],
    { i(0) }
    )),

    s({ trig='ex', name='Trow exit error'}, fmt([[
    throw new Error('Exit'); 
    {}
    ]], { i(0) }
    )),

    s({ trig='//', name='Nice comment'}, fmt([[
    // --------------- {} ---------------
    ]],
    { i(0) }
    )),

    s({ trig='/', name='Multi line comment'}, fmt([[
    /*{}
    */ 
    ]],
    { i(0) }
    )),

    s({ trig='doc', name='Documentation'}, fmt([[
    /**
      * {}
      */ 
    ]],
    { i(0) }
    )),
}
