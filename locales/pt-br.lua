local Translations = {
error = {
    no_cash = 'Você não tem dinheiro suficiente com você!',
},
success = {
    var = 'o texto vai aqui',
},
primary = {
    var = 'o texto vai aqui',
},
menu = {
    open_prompt = 'Abrir ',
    fast_travel_annesburg = 'Viagem Rápida para Annesburg',
    fast_travel_armadillo = 'Viagem Rápida para Armadillo',
    fast_travel_blackwater = 'Viagem Rápida para Blackwater',
    fast_travel_rhodes = 'Viagem Rápida para Rhodes',
    fast_travel_strawberry = 'Viagem Rápida para Strawberry',
    fast_travel_saintdenis = 'Viagem Rápida para Saint Denis',
    fast_travel_tumbleweed = 'Viagem Rápida para Tumbleweed',
    fast_travel_valentine = 'Viagem Rápida para Valentine',
    fast_travel_vanhorn = 'Viagem Rápida para Van Horn',
    fast_travel_sisika = 'Viagem Rápida para Sisika',
    fast_travel_to = 'Viagem Rápida para ',
    ticket_price = 'Preço do Bilhete $ ',
    close_menu = '❌ | Fechar Menu',
    fast_travel = 'Viagem Rápida',
}
}

if GetConvar('rsg_locale', 'en') == 'pt-br' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end

-- Lang:t('error.var')
-- Lang:t('success.var')
-- Lang:t('primary.var')
-- Lang:t('menu.var')
