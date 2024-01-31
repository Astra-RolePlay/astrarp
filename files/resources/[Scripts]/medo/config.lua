-- ## 3dme : shared config file

Config = {
    language = 'en',
    visual = {
        color = { r = 35, g = 150, b = 130, a = 255 }, -- Text color
        font = 0, -- Text font
        time = 5000, -- Duration to display the text (in ms)
        scale = 0.75, -- Text scale
        dist = 250, -- Min. distance to draw 
    },
	
	visuals = {
        color = { r = 144, g = 85, b = 190, a = 255 }, -- Text color
        font = 0, -- Text font
        time = 5000, -- Duration to display the text (in ms)
        scale = 0.75, -- Text scale
        dist = 250, -- Min. distance to draw 
    },
}

Languages = {
    ['en'] = {
        commandName = 'me',
        commandDescription = '',
        commandSuggestion = {{ name = 'action', help = 'yaptığınız eylemleri belirtmenize yarar.'}},
        prefix = ''
    },
    ['fr'] = {
        commandName = 'me',
        commandDescription = 'Affiche une action au dessus de votre tête.',
        commandSuggestion = {{ name = 'action', help = '"se gratte le nez" par exemple.'}},
        prefix = 'l\'individu '
    },
}
