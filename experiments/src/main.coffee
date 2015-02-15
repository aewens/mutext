require.config
    urlArgs: "nocache=" + (new Date).getTime()
        
require [
    "dom"
], ($) ->
    console.log $.create("div").into(document.body)
    console.log $.find("body")
