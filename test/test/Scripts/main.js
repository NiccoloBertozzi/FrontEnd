$(function () {
    /* Nascondo tutti i form non attivi all'inizio */
    $("#delegato, #allenatore").toggle();

    $("#btnAtleta").click(function () {
        /* Cambio l'attivazione del bottone */
        if ($("#btnAtleta").hasClass("active") == false) {
            $("#btnAtleta").addClass("active");
            if ($("#btnDelegato").hasClass("active") == true) $("#btnDelegato").removeClass("active");
            if ($("#btnAllenatore").hasClass("active") == true) $("#btnAllenatore").removeClass("active");
        };
        /* Cambio il modulo da visualizzare ATLETA*/
        if ($("#delegato").is(":visible")) $("#delegato").hide();
        if ($("#allenatore").is(":visible")) $("#allenatore").hide();
        $("#atleta").show();

    })

    $("#btnAllenatore").click(function () {
        /* Cambio l'attivazione del bottone */
        if ($("#btnAllenatore").hasClass("active") == false) {
            $("#btnAllenatore").addClass("active");
            if ($("#btnDelegato").hasClass("active") == true) $("#btnDelegato").removeClass("active");
            if ($("#btnAtleta").hasClass("active") == true) $("#btnAtleta").removeClass("active");
        };
        /* Cambio il modulo da visualizzare ALLENATORE*/
        if ($("#delegato").is(":visible")) $("#delegato").hide();
        $("#allenatore").show();
        if ($("#atleta").is(":visible")) $("#atleta").hide();
    })

    $("#btnDelegato").click(function () {
        /* Cambio l'attivazione del bottone */
        if ($("#btnDelegato").hasClass("active") == false) {
            $("#btnDelegato").addClass("active");
            if ($("#btnAllenatore").hasClass("active") == true) $("#btnAllenatore").removeClass("active");
            if ($("#btnAtleta").hasClass("active") == true) $("#btnAtleta").removeClass("active");
        };
        /* Cambio il modulo da visualizzare DELEGATO*/
        $("#delegato").show();
        if ($("#allenatore").is(":visible")) $("#allenatore").hide();
        if ($("#atleta").is(":visible")) $("#atleta").hide();
    })
})