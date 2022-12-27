_config = {
    object = 'ind_prop_firework_04',
    particle = 'scr_indep_fireworks',
    usableItems = {
        'mfirework'
    },
    messages = {
        ['ALREADY_RUNNING'] = {
            type = 'error',
            title = 'Feuerwerk',
            msg = 'Bitte warte noch einen Moment!',
            fadeout = 5000,
        },
        ['PLACED'] = {
            type = 'info',
            title = 'Feuerwerk',
            msg = 'Du hast das Feuerwerk plaziert, gehe in Deckung!',
            fadeout = 5000,
        }
    }
}



_config.SendNotify = function(data)
    exports['bbrp_notify']:sendNotify(data.type, data.title, data.msg, data.fadeout);
end