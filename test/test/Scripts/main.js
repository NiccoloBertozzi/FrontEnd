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
        if ($("#common").is(":hidden")) $("#common").show();

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
        if ($("#common").is(":hidden")) $("#common").show();
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
        if ($("#common").is(":hidden")) $("#common").show();
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
        if ($("#common").is(":visible")) $("#common").hide();
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
            },
            societa: function () {
                window.location = "Register.aspx?ruolo=Societa";
            }
        }

        let btnAtleta = $("#btnAtleta");
        let btnAllenatore = $("#btnAllenatore");
        let btnDelegato = $("#btnDelegato");
        let btnSocieta = $("#btnSocieta");

        var idTasto = search.get("ruolo");
        if (idTasto == "Atleta") {
            btnAtleta.click();
            // disabilito click
            btnAtleta.off("click");
            btnAllenatore.off("click");
            btnDelegato.off("click");
            btnSocieta.off("click");

            // abilita callback di reindirizzamento
            btnAllenatore.click(redirectFunctions.allenatore);
            btnDelegato.click(redirectFunctions.delegato);
            btnSocieta.click(redirectFunctions.societa);
        }
        else if (idTasto == "Allenatore") {
            $("#btnAllenatore").click();

            btnAtleta.off("click");
            btnAllenatore.off("click");
            btnDelegato.off("click");
            btnSocieta.off("click");

            btnAtleta.click(redirectFunctions.atleta);
            btnDelegato.click(redirectFunctions.delegato);
            btnSocieta.click(redirectFunctions.societa);
        }
        else if (idTasto == "Delegato") {
            $("#btnDelegato").click();

            btnAtleta.off("click");
            btnAllenatore.off("click");
            btnDelegato.off("click");
            btnSocieta.off("click");

            btnAtleta.click(redirectFunctions.atleta);
            btnAllenatore.click(redirectFunctions.allenatore);
            btnSocieta.click(redirectFunctions.societa);
        }
        else if (idTasto == "Societa") {
            $("#btnSocieta").click();

            btnAtleta.off("click");
            btnAllenatore.off("click");
            btnDelegato.off("click");
            btnSocieta.off("click");

            btnAtleta.click(redirectFunctions.atleta);
            btnAllenatore.click(redirectFunctions.allenatore);
            btnDelegato.click(redirectFunctions.societa);

        }
    }


    /* Cambio i colori dei Button nell'OutputTorneiIscritti.aspx */
    $("#iscrittibtn").click(function () {
        /* Cambio l'attivazione del bottone */
        if ($("#iscrittibtn").hasClass("btn-primary") == false) {
            $("#iscrittibtn").addClass("btn-primary");
            $("#iscrittibtn").removeClass("btn-secondary");
            if ($("#incorsobtn").hasClass("btn-primary") == true) {
                $("#incorsobtn").removeClass("btn-primary");
                $("#incorsobtn").addClass("btn-secondary");
            };
            if ($("#finitibtn").hasClass("btn-primary") == true) {
                $("#finitibtn").removeClass("btn-primary");
                $("#finitibtn").addClass("btn-secondary");
            };
        }
    })

    $("#incorsobtn").click(function () {
        /* Cambio l'attivazione del bottone */
        if ($("#incorsobtn").hasClass("btn-primary") == false) {
            $("#incorsobtn").addClass("btn-primary");
            $("#incorsobtn").removeClass("btn-secondary");
            if ($("#iscrittibtn").hasClass("btn-primary") == true) {
                $("#iscrittibtn").removeClass("btn-primary");
                $("#iscrittibtn").addClass("btn-secondary");
            };
            if ($("#finitibtn").hasClass("btn-primary") == true) {
                $("#finitibtn").removeClass("btn-primary");
                $("#finitibtn").addClass("btn-secondary");
            };
        };
    })

    $("#finitibtn").click(function () {
        /* Cambio l'attivazione del bottone */
        if ($("#finitibtn").hasClass("btn-primary") == false) {
            $("#finitibtn").addClass("btn-primary");
            $("#finitibtn").removeClass("btn-secondary");
            if ($("#iscrittibtn").hasClass("btn-primary") == true) {
                $("#iscrittibtn").removeClass("btn-primary");
                $("#iscrittibtn").addClass("btn-secondary");
            };
            if ($("#incorsobtn").hasClass("btn-primary") == true) {
                $("#incorsobtn").removeClass("btn-primary");
                $("#incorsobtn").addClass("btn-secondary");
            };
        };
    })
    $("#btnatleta").click(function () {
        /* Cambio l'attivazione del bottone */
        if ($("#btnatleta").hasClass("btn-primary") == false) {
            $("#btnatleta").addClass("btn-primary");
            $("#btnatleta").removeClass("btn-secondary");
            if ($("#btnallentaore").hasClass("btn-primary") == true) {
                $("#btnallentaore").removeClass("btn-primary");
                $("#btnallentaore").addClass("btn-secondary");
            };
        };
    })
    $("#btnallentaore").click(function () {
        /* Cambio l'attivazione del bottone */
        if ($("#btnallentaore").hasClass("btn-primary") == false) {
            $("#btnallentaore").addClass("btn-primary");
            $("#btnallentaore").removeClass("btn-secondary");
            if ($("#btnatleta").hasClass("btn-primary") == true) {
                $("#btnatleta").removeClass("btn-primary");
                $("#btnatleta").addClass("btn-secondary");
            };
        };
    })

})