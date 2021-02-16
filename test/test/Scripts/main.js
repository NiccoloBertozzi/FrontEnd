$(function () {
    var search = new URLSearchParams(window.location.search);
    /* Nascondo tutti i form non attivi all'inizio */
    $("#delegato, #allenatore, #societa").hide();

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
            if ($("#btnSocieta").hasClass("btn-info") == true) {
                $("#btnSocieta").removeClass("btn-info");
                $("#btnSocieta").addClass("btn-secondary");
            };
        };
        /* Cambio il modulo da visualizzare ATLETA*/
        if ($("#delegato").is(":visible")) $("#delegato").hide();
        if ($("#allenatore").is(":visible")) $("#allenatore").hide();
        if ($("#societa").is(":visible")) $("#societa").hide();
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
            if ($("#btnSocieta").hasClass("btn-info") == true) {
                $("#btnSocieta").removeClass("btn-info");
                $("#btnSocieta").addClass("btn-secondary");
            };
        };
        /* Cambio il modulo da visualizzare ALLENATORE*/
        if ($("#delegato").is(":visible")) $("#delegato").hide();
        $("#allenatore").show();
        if ($("#atleta").is(":visible")) $("#atleta").hide();
        if ($("#societa").is(":visible")) $("#societa").hide();
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
            if ($("#btnSocieta").hasClass("btn-info") == true) {
                $("#btnSocieta").removeClass("btn-info");
                $("#btnSocieta").addClass("btn-secondary");
            };
        };
        /* Cambio il modulo da visualizzare DELEGATO*/
        $("#delegato").show();
        if ($("#allenatore").is(":visible")) $("#allenatore").hide();
        if ($("#atleta").is(":visible")) $("#atleta").hide();
        if ($("#societa").is(":visible")) $("#societa").hide();
    })

    $("#btnSocieta").click(function () {
        /* Cambio l'attivazione del bottone */
        if ($("#btnSocieta").hasClass("btn-info") == false) {
            $("#btnSocieta").addClass("btn-info");
            $("#btnSocieta").removeClass("btn-secondary");
            if ($("#btnAllenatore").hasClass("btn-info") == true) {
                $("#btnAllenatore").removeClass("btn-info");
                $("#btnAllenatore").addClass("btn-secondary");
            };
            if ($("#btnAtleta").hasClass("btn-info") == true) {
                $("#btnAtleta").removeClass("btn-info");
                $("#btnAtleta").addClass("btn-secondary");
            };
            if ($("#btnDelegato").hasClass("btn-info") == true) {
                $("#btnDelegato").removeClass("btn-info");
                $("#btnDelegato").addClass("btn-secondary");
            };
        };
        /* Cambio il modulo da visualizzare DELEGATO*/
        if ($("#delegato").is(":visible")) $("#delegato").hide();
        if ($("#allenatore").is(":visible")) $("#allenatore").hide();
        if ($("#atleta").is(":visible")) $("#atleta").hide();
        $("#societa").show();
    })

    if (search.has("ruolo")) {

        const redirectFunctions = {
            atleta: function () {
                window.location = "Register.aspx?ruolo=Atleta";
            },
            allenatore: function () {
                window.location = "Register.aspx?ruolo=Allenatore";
            },
            delegato: function () {
                window.location = "Register.aspx?ruolo=Delegato";
            }
        }

        let btnAtleta = $("#btnAtleta");
        let btnAllenatore = $("#btnAllenatore");
        let btnDelegato = $("#btnDelegato");

        var idTasto = search.get("ruolo");
        if (idTasto == "Atleta") {
            btnAtleta.click();
            // disabilito click
            btnAtleta.off("click");
            btnAllenatore.off("click");
            btnDelegato.off("click");

            // abilita callback di reindirizzamento
            btnAllenatore.click(redirectFunctions.allenatore);
            btnDelegato.click(redirectFunctions.delegato);
        }
        else if (idTasto == "Allenatore") {
            $("#btnAllenatore").click();

            btnAtleta.off("click");
            btnAllenatore.off("click");
            btnDelegato.off("click");

            btnAtleta.click(redirectFunctions.atleta);
            btnDelegato.click(redirectFunctions.delegato);
        }
        else if (idTasto == "Delegato") {
            $("#btnDelegato").click();

            btnAtleta.off("click");
            btnAllenatore.off("click");
            btnDelegato.off("click");

            btnAtleta.click(redirectFunctions.atleta);
            btnAllenatore.click(redirectFunctions.allenatore);
        }
    }

})