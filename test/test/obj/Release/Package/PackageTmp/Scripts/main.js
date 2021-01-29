$(function () {
    /* Nascondo tutti i form non attivi all'inizio */
    $("#delegato, #allenatore").toggle();

    $("#btnAtleta").click(function () {
        /* Cambio l'attivazione del bottone */
        if ($("#btnAtleta").hasClass("btn-info") == false) {
            $("#btnAtleta").addClass("btn-info");
            $("#btnAtleta").removeClass("btn-secondary");
            if ($("#btnDelegato").hasClass("btn-info") == true) {
                $("#btnDelegato").removeClass("btn-info");
                $("#btnDelegato").addClass("btn-secondary");
            };
            if ($("#btnAllenatore").hasClass("btn-info") == true) {
                $("#btnAllenatore").removeClass("btn-info");
                $("#btnAllenatore").addClass("btn-secondary");
            };
        };
        /* Cambio il modulo da visualizzare ATLETA*/
        if ($("#delegato").is(":visible")) $("#delegato").hide();
        if ($("#allenatore").is(":visible")) $("#allenatore").hide();
        $("#atleta").show();

    })

    $("#btnAllenatore").click(function () {
        /* Cambio l'attivazione del bottone */
        if ($("#btnAllenatore").hasClass("btn-info") == false) {
            $("#btnAllenatore").addClass("btn-info");
            $("#btnAllenatore").removeClass("btn-secondary");
            if ($("#btnDelegato").hasClass("btn-info") == true) {
                $("#btnDelegato").removeClass("btn-info");
                $("#btnDelegato").addClass("btn-secondary");
            };
            if ($("#btnAtleta").hasClass("btn-info") == true) {
                $("#btnAtleta").removeClass("btn-info");
                $("#btnAtleta").addClass("btn-secondary");
            };
        };
        /* Cambio il modulo da visualizzare ALLENATORE*/
        if ($("#delegato").is(":visible")) $("#delegato").hide();
        $("#allenatore").show();
        if ($("#atleta").is(":visible")) $("#atleta").hide();
    })

    $("#btnDelegato").click(function () {
        /* Cambio l'attivazione del bottone */
        if ($("#btnDelegato").hasClass("btn-info") == false) {
            $("#btnDelegato").addClass("btn-info");
            $("#btnDelegato").removeClass("btn-secondary");
            if ($("#btnAllenatore").hasClass("btn-info") == true) {
                $("#btnAllenatore").removeClass("btn-info");
                $("#btnAllenatore").addClass("btn-secondary");
            };
            if ($("#btnAtleta").hasClass("btn-info") == true) {
                $("#btnAtleta").removeClass("btn-info");
                $("#btnAtleta").addClass("btn-secondary");
            };
        };
        /* Cambio il modulo da visualizzare DELEGATO*/
        $("#delegato").show();
        if ($("#allenatore").is(":visible")) $("#allenatore").hide();
        if ($("#atleta").is(":visible")) $("#atleta").hide();
    })
})