
local function copyTable(tbl)
    local container = {
        itens = {}
    }
    for k, v in pairs(tbl) do
        container.itens[k] = v
    end
    return container
end


local weapon_items = {
    ['pecadearma'] = 9999999,-- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
    ['gatilho'] = 9999999,-- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
    ['molas'] = 9999999,-- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
    ['placa-metal'] = 9999999, -- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
}

local  munition_items = {
    ['capsulas'] = 9999999,-- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
    ['polvora'] = 9999999,-- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
}


local dismantling_items = {
    ['placa-metal'] = 9999999,-- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
    ['papel'] = 9999999,-- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
}

local washing_itens = {
    ['dinheirosujo'] = 9999999, -- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
    ['linha'] = 9999999, -- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
    ['cartaovirgem'] = 9999999, -- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
    ['placa-metal'] = 9999999, -- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
    ['tecido'] = 9999999, -- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
}

local food_itens = {
    ['leite_de_gado'] = 9999999,
    ['graos_de_cafe'] = 9999999,
    ['farinha_de_trigo'] = 9999999,
    ['acucar'] = 9999999,
    ['limao'] = 9999999,
    ['laranja'] = 9999999,
    ['carnedegado'] = 9999999,
    ['sal'] = 9999999,
    ['arroz'] = 9999999,
    ['feijao'] = 9999999,
    ['queijo'] = 9999999,
    ['embutidos'] = 9999999,
}




Config = {
    -- images = 'http://localhost/images/', -- URL DAS SUAS IMAGENS
    images = 'http://127.0.0.1/ultimate/inventario/', -- URL DAS SUAS IMAGENS
    storeLink = 'seulinkaqui', -- LINK DA SUA LOJA
    dirtymoney = 'dinheirosujo', -- SPAWN DO DINHEIRO SUJO

    Tables = {
        ['Armas'] = {
            -- INICIO DE UMA BANCADA, NUNCA REPETIR ESSE NOME
            craft = {
                -- ZONA DE CRAFT
                {
                    item = 'WEAPON_PISTOL_MK2', -- SPAWN DO ITEM
                    amount = 1, -- Quantidade de item que vai receber por unidade selecionada.
                    itemTime = 20, -- 30 segundo(s) para a maquina concluir o craft.
                    requires = {
                        -- ITENS NECESSARIOS PARA O CRAFT
                        { item = "pecadearma" , amount = 30 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                        { item = "gatilho" , amount = 1 },  
                        { item = "molas" , amount = 10 },  
                        { item = "placa-metal" , amount = 10 }
                    }
                },
                {
                    item = 'WEAPON_MICROSMG', -- SPAWN DO ITEM
                    amount = 1, -- Quantidade de item que vai receber por unidade selecionada.
                    itemTime = 30, -- 30 segundo(s) para a maquina concluir o craft.
                    requires = {
                        -- ITENS NECESSARIOS PARA O CRAFT
                        { item = "pecadearma" , amount = 150 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                        { item = "gatilho" , amount = 1 },  
                        { item = "molas" , amount = 15 },  
                        { item = "placa-metal" , amount = 15 }
                    }
                },
                {
                    item = 'WEAPON_ASSAULTRIFLE_MK2', -- SPAWN DO ITEM
                    amount = 1, -- Quantidade de item que vai receber por unidade selecionada.
                    itemTime = 35, -- 30 segundo(s) para a maquina concluir o craft.
                    requires = {
                        -- ITENS NECESSARIOS PARA O CRAFT
                        { item = "pecadearma" , amount = 300 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                        { item = "gatilho" , amount = 1 },  
                        { item = "molas" , amount = 15 },  
                        { item = "placa-metal" , amount = 15 }
                    }
                },
                {
                    item = 'WEAPON_ADVANCEDRIFLE', -- SPAWN DO ITEM
                    amount = 1, -- Quantidade de item que vai receber por unidade selecionada.
                    itemTime = 45, -- 30 segundo(s) para a maquina concluir o craft.
                    requires = {
                        -- ITENS NECESSARIOS PARA O CRAFT
                        { item = "pecadearma" , amount = 250 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                        { item = "gatilho" , amount = 1 },  
                        { item = "molas" , amount = 20 },  
                        { item = "placa-metal" , amount = 20 }
                    }
                }
            },
            farm = {
                -- ZONA DE FARM
                list = {
                    {
                        dangerRoute = {
                            status = false, -- Rota Perigosa ( CHANCE DE CHAMAR A POLICIA )
                            percentualPolice = 30 -- 3% De chamar A Policia ( APENAS SE O DangerRoute For ativo )
                        },
                        dominationBonus = {
                            -- Caso utilize o script mirtin_dominacao e queira dobrar/triplicar o farm se tiver a zona dominada.
                            status = true, -- Se o sistema ta ativo ou não
                            zone = 'Armas', -- Qual a zona que precisa ter dominada para boostar o farm. Exemplo: [ 'Armas', 'Municao' ou etc ]
                            bonus = 2 -- 2x Quantidade que o farm vai duplicar quando estiver com a zona dominada.
                        },
                        itensList = {
                            {item = 'molas', minAmount = 10, maxAmount = 15},
                            {item = 'placa-metal', minAmount = 10, maxAmount = 15},
                            {item = 'gatilho', minAmount = 5, maxAmount = 10},
                        }
                    },
                    {
                        dangerRoute = {
                            status = false, -- Rota Perigosa ( CHANCE DE CHAMAR A POLICIA )
                            percentualPolice = 3 -- 3% De chamar A Policia ( APENAS SE O DangerRoute For ativo )
                        },
                        dominationBonus = {
                            -- Caso utilize o script mirtin_dominacao e queira dobrar/triplicar o farm se tiver a zona dominada.
                            status = true, -- Se o sistema ta ativo ou não
                            zone = false, -- Qual a zona que precisa ter dominada para boostar o farm. Exemplo: [ 'Armas', 'Municao' ou etc ]
                            bonus = 2 -- 2x Quantidade que o farm vai duplicar quando estiver com a zona dominada.
                        },
                        itensList = {
                            {item = 'pecadearma', minAmount = 50, maxAmount = 60}
                        }
                    }
                }
            },
            delivery = {
                list = {
                    -- {
                    --     dangerRoute = {
                    --         status = true, -- Rota Perigosa ( CHANCE DE CHAMAR A POLICIA )
                    --         percentualPolice = 50 -- 3% De chamar A Policia ( APENAS SE O DangerRoute For ativo )
                    --     },
                    --     itensList = {
                    --         {item = 'cocaina', minAmount = 5, maxAmount = 10, type = 'ilegal', payment = 1260}, -- ( TYPE legal = dinheiro normal, ilegal = dinheiro sujo) ( payment valor por unidade )
                    --         {item = 'maconha', minAmount = 5, maxAmount = 10, type = 'ilegal', payment = 1260} -- ( TYPE legal = dinheiro normal, ilegal = dinheiro sujo) ( payment valor por unidade )
                    --     }
                    -- }
                }
            },
            locations = {
                -- LOCALIZACOES DESSAS BANCADAS
                {
                    -- POSSIVEL ADICIONAR VARIAS LOCALIZACOES E VARIAS ORGANIZACOES DIFERENTE
                    name = 'Mafia',
                    coords = vec3(412.21,3.96,84.92), -- COORDENADAS DA BANCADA
                    requireStorage = {
                        -- SE VAI PUXAR OS ITENS DO ARMAZEM NA HORA DE FABRICAR ( Caso for true configurar na parte Storages )
                        active = true,
                        name = 'Mafia'
                    },
                    tablePermission = 'perm.mafia', -- PERMISSAO PARA ACESSAR A BANCADA
                    craftPermission = 'perm.lidermafia', -- PERMISSAO PARA CRAFTAR ITEM
                    drawMarker = function(coords, dist)
                        if dist <= 5.0 then
                            DrawText3Ds(
                                coords.x,
                                coords.y,
                                coords.z + 0.1,
                                'Pressione ~p~[E]~w~ para acessar a bancada.'
                            )
                            DrawMarker(
                                27,
                                coords.x,
                                coords.y,
                                coords.z - 0.95,
                                0,
                                0,
                                0,
                                0,
                                0,
                                0,
                                1.5,
                                1.5,
                                1.5,
                                132,
                                102,
                                226,
                                180,
                                0,
                                0,
                                0,
                                1
                            )
                        end
                    end -- BLIP DO CHAO
                },
                
                {
                    -- POSSIVEL ADICIONAR VARIAS LOCALIZACOES E VARIAS ORGANIZACOES DIFERENTE
                    name = 'Yakuza',
                    coords = vec3(-179.03,303.37,100.91), -- COORDENADAS DA BANCADA
                    requireStorage = {
                        -- SE VAI PUXAR OS ITENS DO ARMAZEM NA HORA DE FABRICAR ( Caso for true configurar na parte Storages )
                        active = true,
                        name = 'Yakuza'
                    },
                    tablePermission = 'perm.yakuza', -- PERMISSAO PARA ACESSAR A BANCADA
                    craftPermission = 'perm.lideryakuza', -- PERMISSAO PARA CRAFTAR ITEM
                    drawMarker = function(coords, dist)
                        if dist <= 5.0 then
                            DrawText3Ds(
                                coords.x,
                                coords.y,
                                coords.z + 0.1,
                                'Pressione ~p~[E]~w~ para acessar a bancada.'
                            )
                            DrawMarker(
                                27,
                                coords.x,
                                coords.y,
                                coords.z - 0.95,
                                0,
                                0,
                                0,
                                0,
                                0,
                                0,
                                1.5,
                                1.5,
                                1.5,
                                132,
                                102,
                                226,
                                180,
                                0,
                                0,
                                0,
                                1
                            )
                        end
                    end -- BLIP DO CHAO
                },


                {
                    -- POSSIVEL ADICIONAR VARIAS LOCALIZACOES E VARIAS ORGANIZACOES DIFERENTE
                    name = 'Verdes',
                    coords = vec3(1500.64,-808.11,115.15), -- COORDENADAS DA BANCADA
                    requireStorage = {
                        -- SE VAI PUXAR OS ITENS DO ARMAZEM NA HORA DE FABRICAR ( Caso for true configurar na parte Storages )
                        active = true,
                        name = 'Verdes'
                    },
                    tablePermission = 'Verdes.permissao', -- PERMISSAO PARA ACESSAR A BANCADA
                    craftPermission = 'liderVerdes.permissao', -- PERMISSAO PARA CRAFTAR ITEM
                    drawMarker = function(coords, dist)
                        if dist <= 5.0 then
                            DrawText3Ds(
                                coords.x,
                                coords.y,
                                coords.z + 0.1,
                                'Pressione ~p~[E]~w~ para acessar a bancada.'
                            )
                            DrawMarker(
                                27,
                                coords.x,
                                coords.y,
                                coords.z - 0.95,
                                0,
                                0,
                                0,
                                0,
                                0,
                                0,
                                1.5,
                                1.5,
                                1.5,
                                132,
                                102,
                                226,
                                180,
                                0,
                                0,
                                0,
                                1
                            )
                        end
                    end -- BLIP DO CHAO
                },
               
            }
        },
        ['Municao'] = {
            -- INICIO DE UMA BANCADA, NUNCA REPETIR ESSE NOME
            craft = {
                -- ZONA DE CRAFT
                {
                    item = 'AMMO_PISTOL_MK2', -- SPAWN DO ITEM
                    amount = 50, -- Quantidade de item que vai receber por unidade selecionada.
                    itemTime = 15, -- 30 segundo(s) para a maquina concluir o craft.
                    requires = {
                        -- ITENS NECESSARIOS PARA O CRAFT
                        { item = "capsulas" , amount = 40 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                        { item = "polvora" , amount = 40 }  
                    }
                },
                {
                    item = 'AMMO_MICROSMG', -- SPAWN DO ITEM
                    amount = 50, -- Quantidade de item que vai receber por unidade selecionada.
                    itemTime = 20, -- 30 segundo(s) para a maquina concluir o craft.
                    requires = {
                        -- ITENS NECESSARIOS PARA O CRAFT
                        { item = "capsulas" , amount = 75 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                        { item = "polvora" , amount = 50 }  
                    }
                },
                {
                    item = 'AMMO_ADVANCEDRIFLE', -- SPAWN DO ITEM
                    amount = 50, -- Quantidade de item que vai receber por unidade selecionada.
                    itemTime = 15, -- 30 segundo(s) para a maquina concluir o craft.
                    requires = {
                        -- ITENS NECESSARIOS PARA O CRAFT
                        { item = "capsulas" , amount = 100 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                        { item = "polvora" , amount = 60 }  
                    }
                },
                {
                    item = 'AMMO_ASSAULTRIFLE_MK2', -- SPAWN DO ITEM
                    amount = 50, -- Quantidade de item que vai receber por unidade selecionada.
                    itemTime = 15, -- 30 segundo(s) para a maquina concluir o craft.
                    requires = {
                        -- ITENS NECESSARIOS PARA O CRAFT
                        { item = "capsulas" , amount = 150 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                        { item = "polvora" , amount = 70 }  
                    }
                },
            },
            farm = {
                -- ZONA DE FARM
                list = {
                    {
                        dangerRoute = {
                            status = false, -- Rota Perigosa ( CHANCE DE CHAMAR A POLICIA )
                            percentualPolice = 3 -- 3% De chamar A Policia ( APENAS SE O DangerRoute For ativo )
                        },
                        dominationBonus = {
                            -- Caso utilize o script mirtin_dominacao e queira dobrar/triplicar o farm se tiver a zona dominada.
                            status = true, -- Se o sistema ta ativo ou não
                            zone = false, -- Qual a zona que precisa ter dominada para boostar o farm. Exemplo: [ 'Armas', 'Municao' ou etc ]
                            bonus = 2 -- 2x Quantidade que o farm vai duplicar quando estiver com a zona dominada.
                        },
                        itensList = {
                            {item = 'capsulas', minAmount = 10, maxAmount = 15},
                            {item = 'polvora', minAmount = 7, maxAmount = 10}

                        }
                    }
                }
            },
            delivery = {
                list = {
                    -- {
                    --     dangerRoute = {
                    --         status = true, -- Rota Perigosa ( CHANCE DE CHAMAR A POLICIA )
                    --         percentualPolice = 50 -- 3% De chamar A Policia ( APENAS SE O DangerRoute For ativo )
                    --     },
                    --     itensList = {
                    --         {item = 'cocaina', minAmount = 5, maxAmount = 10, type = 'ilegal', payment = 1260}, -- ( TYPE legal = dinheiro normal, ilegal = dinheiro sujo) ( payment valor por unidade )
                    --         {item = 'maconha', minAmount = 5, maxAmount = 10, type = 'ilegal', payment = 1260} -- ( TYPE legal = dinheiro normal, ilegal = dinheiro sujo) ( payment valor por unidade )
                    --     }
                    -- }
                }
            },
            locations = {
                -- LOCALIZACOES DESSAS BANCADAS
                {
                    -- POSSIVEL ADICIONAR VARIAS LOCALIZACOES E VARIAS ORGANIZACOES DIFERENTE
                    name = 'Anonymous',
                    coords = vec3(763.93,-1905.08,29.45), -- COORDENADAS DA BANCADA
                    requireStorage = {
                        -- SE VAI PUXAR OS ITENS DO ARMAZEM NA HORA DE FABRICAR ( Caso for true configurar na parte Storages )
                        active = true,
                        name = 'Anonymous'
                    },
                    tablePermission = 'perm.anonymous', -- PERMISSAO PARA ACESSAR A BANCADA
                    craftPermission = 'perm.lideranonymous', -- PERMISSAO PARA CRAFTAR ITEM
                    drawMarker = function(coords, dist)
                        if dist <= 5.0 then
                            DrawText3Ds(
                                coords.x,
                                coords.y,
                                coords.z + 0.1,
                                'Pressione ~p~[E]~w~ para acessar a bancada.'
                            )
                            DrawMarker(
                                27,
                                coords.x,
                                coords.y,
                                coords.z - 0.95,
                                0,
                                0,
                                0,
                                0,
                                0,
                                0,
                                1.5,
                                1.5,
                                1.5,
                                132,
                                102,
                                226,
                                180,
                                0,
                                0,
                                0,
                                1
                            )
                        end
                    end -- BLIP DO CHAO
                },

                {
                    -- POSSIVEL ADICIONAR VARIAS LOCALIZACOES E VARIAS ORGANIZACOES DIFERENTE
                    name = 'Bratva',
                    coords = vec3(-2679.52,1326.95,144.25), -- COORDENADAS DA BANCADA
                    requireStorage = {
                        -- SE VAI PUXAR OS ITENS DO ARMAZEM NA HORA DE FABRICAR ( Caso for true configurar na parte Storages )
                        active = true,
                        name = 'Bratva'
                    },
                    tablePermission = 'perm.bratva', -- PERMISSAO PARA ACESSAR A BANCADA
                    craftPermission = 'perm.liderbratva', -- PERMISSAO PARA CRAFTAR ITEM
                    drawMarker = function(coords, dist)
                        if dist <= 5.0 then
                            DrawText3Ds(
                                coords.x,
                                coords.y,
                                coords.z + 0.1,
                                'Pressione ~p~[E]~w~ para acessar a bancada.'
                            )
                            DrawMarker(
                                27,
                                coords.x,
                                coords.y,
                                coords.z - 0.95,
                                0,
                                0,
                                0,
                                0,
                                0,
                                0,
                                1.5,
                                1.5,
                                1.5,
                                132,
                                102,
                                226,
                                180,
                                0,
                                0,
                                0,
                                1
                            )
                        end
                    end -- BLIP DO CHAO
                },
                
                {
                    -- POSSIVEL ADICIONAR VARIAS LOCALIZACOES E VARIAS ORGANIZACOES DIFERENTE
                    name = 'Cartel',
                    coords = vec3(1405.88, 1137.92, 109.75), -- COORDENADAS DA BANCADA
                    requireStorage = {
                        -- SE VAI PUXAR OS ITENS DO ARMAZEM NA HORA DE FABRICAR ( Caso for true configurar na parte Storages )
                        active = true,
                        name = 'Cartel'
                    },
                    tablePermission = 'perm.cartel', -- PERMISSAO PARA ACESSAR A BANCADA
                    craftPermission = 'perm.lidercartel', -- PERMISSAO PARA CRAFTAR ITEM
                    drawMarker = function(coords, dist)
                        if dist <= 5.0 then
                            DrawText3Ds(
                                coords.x,
                                coords.y,
                                coords.z + 0.1,
                                'Pressione ~p~[E]~w~ para acessar a bancada.'
                            )
                            DrawMarker(
                                27,
                                coords.x,
                                coords.y,
                                coords.z - 0.95,
                                0,
                                0,
                                0,
                                0,
                                0,
                                0,
                                1.5,
                                1.5,
                                1.5,
                                132,
                                102,
                                226,
                                180,
                                0,
                                0,
                                0,
                                1
                            )
                        end
                    end -- BLIP DO CHAO
                },

                {
                    -- POSSIVEL ADICIONAR VARIAS LOCALIZACOES E VARIAS ORGANIZACOES DIFERENTE
                    name = 'Triade',
                    coords = vec3(-867.25,-1458.22,7.53), -- COORDENADAS DA BANCADA
                    requireStorage = {
                        -- SE VAI PUXAR OS ITENS DO ARMAZEM NA HORA DE FABRICAR ( Caso for true configurar na parte Storages )
                        active = true,
                        name = 'Triade'
                    },
                    tablePermission = 'perm.triade', -- PERMISSAO PARA ACESSAR A BANCADA
                    craftPermission = 'perm.lidertriade', -- PERMISSAO PARA CRAFTAR ITEM
                    drawMarker = function(coords, dist)
                        if dist <= 5.0 then
                            DrawText3Ds(
                                coords.x,
                                coords.y,
                                coords.z + 0.1,
                                'Pressione ~p~[E]~w~ para acessar a bancada.'
                            )
                            DrawMarker(
                                27,
                                coords.x,
                                coords.y,
                                coords.z - 0.95,
                                0,
                                0,
                                0,
                                0,
                                0,
                                0,
                                1.5,
                                1.5,
                                1.5,
                                132,
                                102,
                                226,
                                180,
                                0,
                                0,
                                0,
                                1
                            )
                        end
                    end -- BLIP DO CHAO
                },

           }
        }, -- FIM DE UMA BANCADA

        ['Desmanche'] = {
            -- INICIO DE UMA BANCADA, NUNCA REPETIR ESSE NOME
            craft = {
                -- ZONA DE CRAFT
                {
                    item = 'lockpick', -- SPAWN DO ITEM
                    amount = 1, -- Quantidade de item que vai receber por unidade selecionada.
                    itemTime = 10, -- 30 segundo(s) para a maquina concluir o craft.
                    requires = {
                        -- ITENS NECESSARIOS PARA O CRAFT
                        { item = "placa-metal" , amount = 50 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                    }
                },
                {
                    item = 'ticketcorrida', -- SPAWN DO ITEM
                    amount = 1, -- Quantidade de item que vai receber por unidade selecionada.
                    itemTime = 10, -- 30 segundo(s) para a maquina concluir o craft.
                    requires = {
                        -- ITENS NECESSARIOS PARA O CRAFT
                        { item = "papel" , amount = 50 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                    }
                },

            },
            farm = {
                -- ZONA DE FARM
                list = {
                    {
                        dangerRoute = {
                            status = true, -- Rota Perigosa ( CHANCE DE CHAMAR A POLICIA )
                            percentualPolice = 3 -- 3% De chamar A Policia ( APENAS SE O DangerRoute For ativo )
                        },
                        dominationBonus = {
                            -- Caso utilize o script mirtin_dominacao e queira dobrar/triplicar o farm se tiver a zona dominada.
                            status = true, -- Se o sistema ta ativo ou não
                            zone = false, -- Qual a zona que precisa ter dominada para boostar o farm. Exemplo: [ 'Armas', 'Municao' ou etc ]
                            bonus = 2 -- 2x Quantidade que o farm vai duplicar quando estiver com a zona dominada.
                        },
                        itensList = {
                            {item = 'placa-metal', minAmount = 7, maxAmount = 15},
                            {item = 'papel', minAmount = 5, maxAmount = 14},
                        }
                    }
                }
            },
            delivery = {
                list = {

                }
            },
            locations = {
                -- LOCALIZACOES DESSAS BANCADAS
                {
                    -- POSSIVEL ADICIONAR VARIAS LOCALIZACOES E VARIAS ORGANIZACOES DIFERENTE
                    name = 'Bennys',
                    coords = vec3(-197.41, -1320.46, 31.09), -- COORDENADAS DA BANCADA
                    requireStorage = {
                        -- SE VAI PUXAR OS ITENS DO ARMAZEM NA HORA DE FABRICAR ( Caso for true configurar na parte Storages )
                        active = true,
                        name = 'Bennys'
                    },
                    tablePermission = 'perm.bennys', -- PERMISSAO PARA ACESSAR A BANCADA
                    craftPermission = 'perm.liderbennys', -- PERMISSAO PARA CRAFTAR ITEM
                    drawMarker = function(coords, dist)
                        if dist <= 5.0 then
                            DrawText3Ds(
                                coords.x,
                                coords.y,
                                coords.z + 0.1,
                                'Pressione ~p~[E]~w~ para acessar a bancada.'
                            )
                            DrawMarker(
                                27,
                                coords.x,
                                coords.y,
                                coords.z - 0.95,
                                0,
                                0,
                                0,
                                0,
                                0,
                                0,
                                1.5,
                                1.5,
                                1.5,
                                132,
                                102,
                                226,
                                180,
                                0,
                                0,
                                0,
                                1
                            )
                        end
                    end -- BLIP DO CHAO
                },

                {
                    -- POSSIVEL ADICIONAR VARIAS LOCALIZACOES E VARIAS ORGANIZACOES DIFERENTE
                    name = 'Furious',
                    coords = vec3(978.66,-91.89,74.85), -- COORDENADAS DA BANCADA
                    requireStorage = {
                        -- SE VAI PUXAR OS ITENS DO ARMAZEM NA HORA DE FABRICAR ( Caso for true configurar na parte Storages )
                        active = true,
                        name = 'Furious'
                    },
                    tablePermission = 'perm.furious', -- PERMISSAO PARA ACESSAR A BANCADA
                    craftPermission = 'perm.liderfurious', -- PERMISSAO PARA CRAFTAR ITEM
                    drawMarker = function(coords, dist)
                        if dist <= 5.0 then
                            DrawText3Ds(
                                coords.x,
                                coords.y,
                                coords.z + 0.1,
                                'Pressione ~p~[E]~w~ para acessar a bancada.'
                            )
                            DrawMarker(
                                27,
                                coords.x,
                                coords.y,
                                coords.z - 0.95,
                                0,
                                0,
                                0,
                                0,
                                0,
                                0,
                                1.5,
                                1.5,
                                1.5,
                                132,
                                102,
                                226,
                                180,
                                0,
                                0,
                                0,
                                1
                            )
                        end
                    end -- BLIP DO CHAO
                }
                
        }, -- FIM DE UMA BANCADA

        }, -- FIM DA  CONFIGURACAO

        ['Maconha'] = {
            -- INICIO DE UMA BANCADA, NUNCA REPETIR ESSE NOME
            craft = {
                -- ZONA DE CRAFT

                {
                    item = 'maconha', -- SPAWN DO ITEM
                    amount = 5, -- Quantidade de item que vai receber por unidade selecionada.
                    itemTime = 15, -- 30 segundo(s) para a maquina concluir o craft.
                    requires = {
                        -- ITENS NECESSARIOS PARA O CRAFT
                        { item = "adubo" , amount = 25 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                    }
                }

            },
            farm = {
                -- ZONA DE FARM
                list = {
                    {
                        dangerRoute = {
                            status = true, -- Rota Perigosa ( CHANCE DE CHAMAR A POLICIA )
                            percentualPolice = 3 -- 3% De chamar A Policia ( APENAS SE O DangerRoute For ativo )
                        },
                        dominationBonus = {
                            -- Caso utilize o script mirtin_dominacao e queira dobrar/triplicar o farm se tiver a zona dominada.
                            status = true, -- Se o sistema ta ativo ou não
                            zone = false, -- Qual a zona que precisa ter dominada para boostar o farm. Exemplo: [ 'Armas', 'Municao' ou etc ]
                            bonus = 2 -- 2x Quantidade que o farm vai duplicar quando estiver com a zona dominada.
                        },
                        itensList = {
                            {item = 'adubo', minAmount = 5, maxAmount = 10},
                        }
                    },

                }
            },
            delivery = {
                list = {

                }
            },
            locations = {
                -- LOCALIZACOES DESSAS BANCADAS
                {
                    -- POSSIVEL ADICIONAR VARIAS LOCALIZACOES E VARIAS ORGANIZACOES DIFERENTE
                    name = 'Vermelhos',
                    coords = vec3(1277.79, -184.82, 103.66), -- COORDENADAS DA BANCADA
                    requireStorage = {
                        -- SE VAI PUXAR OS ITENS DO ARMAZEM NA HORA DE FABRICAR ( Caso for true configurar na parte Storages )
                        active = true,
                        name = 'Vermelhos'
                    },
                    tablePermission = 'Vermelhos.permissao', -- PERMISSAO PARA ACESSAR A BANCADA
                    craftPermission = 'liderVermelhos.permissao', -- PERMISSAO PARA CRAFTAR ITEM
                    drawMarker = function(coords, dist)
                        if dist <= 5.0 then
                            DrawText3Ds(
                                coords.x,
                                coords.y,
                                coords.z + 0.1,
                                'Pressione ~p~[E]~w~ para acessar a bancada.'
                            )
                            DrawMarker(
                                27,
                                coords.x,
                                coords.y,
                                coords.z - 0.95,
                                0,
                                0,
                                0,
                                0,
                                0,
                                0,
                                1.5,
                                1.5,
                                1.5,
                                132,
                                102,
                                226,
                                180,
                                0,
                                0,
                                0,
                                1
                            )
                        end
                    end -- BLIP DO CHAO
                },

        }, -- FIM DE UMA BANCADA

        }, -- FIM DA  CONFIGURACAO

        ['Cocaina'] = {
            -- INICIO DE UMA BANCADA, NUNCA REPETIR ESSE NOME
            craft = {
                -- ZONA DE CRAFT

                {
                    item = 'cocaina', -- SPAWN DO ITEM
                    amount = 5, -- Quantidade de item que vai receber por unidade selecionada.
                    itemTime = 15, -- 30 segundo(s) para a maquina concluir o craft.
                    requires = {
                        -- ITENS NECESSARIOS PARA O CRAFT
                        { item = "componenteq" , amount = 25 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                    }
                }

            },
            farm = {
                -- ZONA DE FARM
                list = {
                    {
                        dangerRoute = {
                            status = true, -- Rota Perigosa ( CHANCE DE CHAMAR A POLICIA )
                            percentualPolice = 3 -- 3% De chamar A Policia ( APENAS SE O DangerRoute For ativo )
                        },
                        dominationBonus = {
                            -- Caso utilize o script mirtin_dominacao e queira dobrar/triplicar o farm se tiver a zona dominada.
                            status = true, -- Se o sistema ta ativo ou não
                            zone = false, -- Qual a zona que precisa ter dominada para boostar o farm. Exemplo: [ 'Armas', 'Municao' ou etc ]
                            bonus = 2 -- 2x Quantidade que o farm vai duplicar quando estiver com a zona dominada.
                        },
                        itensList = {
                            {item = 'componenteq', minAmount = 5, maxAmount = 10},
                        }
                    },

                }
            },
            delivery = {
                list = {

                }
            },
            locations = {
                -- LOCALIZACOES DESSAS BANCADAS
                {
                    -- POSSIVEL ADICIONAR VARIAS LOCALIZACOES E VARIAS ORGANIZACOES DIFERENTE
                    name = 'Laranjas',
                    coords = vec3(861.5, -253.57, 68.34), -- COORDENADAS DA BANCADA
                    requireStorage = {
                        -- SE VAI PUXAR OS ITENS DO ARMAZEM NA HORA DE FABRICAR ( Caso for true configurar na parte Storages )
                        active = true,
                        name = 'Laranjas'
                    },
                    tablePermission = 'Laranjas.permissao', -- PERMISSAO PARA ACESSAR A BANCADA
                    craftPermission = 'liderLaranjas.permissao', -- PERMISSAO PARA CRAFTAR ITEM
                    drawMarker = function(coords, dist)
                        if dist <= 5.0 then
                            DrawText3Ds(
                                coords.x,
                                coords.y,
                                coords.z + 0.1,
                                'Pressione ~p~[E]~w~ para acessar a bancada.'
                            )
                            DrawMarker(
                                27,
                                coords.x,
                                coords.y,
                                coords.z - 0.95,
                                0,
                                0,
                                0,
                                0,
                                0,
                                0,
                                1.5,
                                1.5,
                                1.5,
                                132,
                                102,
                                226,
                                180,
                                0,
                                0,
                                0,
                                1
                            )
                        end
                    end -- BLIP DO CHAO
                },

        }, -- FIM DE UMA BANCADA

        }, -- FIM DA  CONFIGURACAO

        ['lsd'] = {
            -- INICIO DE UMA BANCADA, NUNCA REPETIR ESSE NOME
            craft = {
                -- ZONA DE CRAFT

                {
                    item = 'lsd', -- SPAWN DO ITEM
                    amount = 5, -- Quantidade de item que vai receber por unidade selecionada.
                    itemTime = 15, -- 30 segundo(s) para a maquina concluir o craft.
                    requires = {
                        -- ITENS NECESSARIOS PARA O CRAFT
                        { item = "acidoc" , amount = 25 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                    }
                }

            },
            farm = {
                -- ZONA DE FARM
                list = {
                    {
                        dangerRoute = {
                            status = true, -- Rota Perigosa ( CHANCE DE CHAMAR A POLICIA )
                            percentualPolice = 3 -- 3% De chamar A Policia ( APENAS SE O DangerRoute For ativo )
                        },
                        dominationBonus = {
                            -- Caso utilize o script mirtin_dominacao e queira dobrar/triplicar o farm se tiver a zona dominada.
                            status = true, -- Se o sistema ta ativo ou não
                            zone = false, -- Qual a zona que precisa ter dominada para boostar o farm. Exemplo: [ 'Armas', 'Municao' ou etc ]
                            bonus = 2 -- 2x Quantidade que o farm vai duplicar quando estiver com a zona dominada.
                        },
                        itensList = {
                            {item = 'acidoc', minAmount = 5, maxAmount = 10},
                        }
                    }

                }
            },
            delivery = {
                list = {

                }
            },
            locations = {
                -- LOCALIZACOES DESSAS BANCADAS
                {
                    -- POSSIVEL ADICIONAR VARIAS LOCALIZACOES E VARIAS ORGANIZACOES DIFERENTE
                    name = 'Roxos',
                    coords = vec3(2045.23, 3375.73, 47.77), -- COORDENADAS DA BANCADA
                    requireStorage = {
                        -- SE VAI PUXAR OS ITENS DO ARMAZEM NA HORA DE FABRICAR ( Caso for true configurar na parte Storages )
                        active = true,
                        name = 'Roxos'
                    },
                    tablePermission = 'Roxos.permissao', -- PERMISSAO PARA ACESSAR A BANCADA
                    craftPermission = 'liderRoxos.permissao', -- PERMISSAO PARA CRAFTAR ITEM
                    drawMarker = function(coords, dist)
                        if dist <= 5.0 then
                            DrawText3Ds(
                                coords.x,
                                coords.y,
                                coords.z + 0.1,
                                'Pressione ~p~[E]~w~ para acessar a bancada.'
                            )
                            DrawMarker(
                                27,
                                coords.x,
                                coords.y,
                                coords.z - 0.95,
                                0,
                                0,
                                0,
                                0,
                                0,
                                0,
                                1.5,
                                1.5,
                                1.5,
                                132,
                                102,
                                226,
                                180,
                                0,
                                0,
                                0,
                                1
                            )
                        end
                    end -- BLIP DO CHAO
                },

        }, -- FIM DE UMA BANCADA

        }, -- FIM DA  CONFIGURACAO

        -- INICIO DE UMA BANCADA, NUNCA REPETIR ESSE NOME
        ['Lavagem'] = {
            craft = {
                -- ZONA DE CRAFT
                {
                    item = 'money', -- SPAWN DO ITEM
                    amount = 80000, -- Quantidade de item que vai receber por unidade selecionada.
                    itemTime = 15, -- 30 segundo(s) para a maquina concluir o craft.
                    requires = {
                        -- ITENS NECESSARIOS PARA O CRAFT
                        { item = "dinheirosujo" , amount = 100000 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                    }
                },
                
                {
                    item = 'capuz', -- SPAWN DO ITEM
                    amount = 1, -- Quantidade de item que vai receber por unidade selecionada.
                    itemTime = 5, -- 30 segundo(s) para a maquina concluir o craft.
                    requires = {
                        -- ITENS NECESSARIOS PARA O CRAFT
                        { item = "tecido" , amount = 30 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                    }
                },
                {
                    item = 'algemas', -- SPAWN DO ITEM
                    amount = 1, -- Quantidade de item que vai receber por unidade selecionada.
                    itemTime = 5, -- 30 segundo(s) para a maquina concluir o craft.
                    requires = {
                        -- ITENS NECESSARIOS PARA O CRAFT
                        { item = "placa-metal" , amount = 35 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                    }
                },
                {
                    item = 'body_armor', -- SPAWN DO ITEM
                    amount = 1, -- Quantidade de item que vai receber por unidade selecionada.
                    itemTime = 75, -- 30 segundo(s) para a maquina concluir o craft.
                    requires = {
                        -- ITENS NECESSARIOS PARA O CRAFT
                        { item = "placa-metal" , amount = 40 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                        { item = "linha" , amount = 20 }, 
                        { item = "tecido" , amount = 35 },
                    }
                },
                -- {
                --     item = 'c4', -- SPAWN DO ITEM
                --     amount = 1, -- Quantidade de item que vai receber por unidade selecionada.
                --     itemTime = 25, -- 30 segundo(s) para a maquina concluir o craft.
                --     requires = {
                --         -- ITENS NECESSARIOS PARA O CRAFT
                --         { item = "contador" , amount = 1 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                --         { item = "linha" , amount = 10 }, 
                --         { item = "polvora" , amount = 30 },
                --     }
                -- },
                {
                    item = 'keycard', -- SPAWN DO ITEM
                    amount = 1, -- Quantidade de item que vai receber por unidade selecionada.
                    itemTime = 25, -- 30 segundo(s) para a maquina concluir o craft.
                    requires = {
                        -- ITENS NECESSARIOS PARA O CRAFT
                        { item = "cartaovirgem" , amount = 25 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                        { item = "placa-metal" , amount = 20 } 
                    }
                },

            },
            farm = {
                -- ZONA DE FARM
                list = {
                    {
                        dangerRoute = {
                            status = false, -- Rota Perigosa ( CHANCE DE CHAMAR A POLICIA )
                            percentualPolice = 30 -- 3% De chamar A Policia ( APENAS SE O DangerRoute For ativo )
                        },
                        dominationBonus = {
                            -- Caso utilize o script mirtin_dominacao e queira dobrar/triplicar o farm se tiver a zona dominada.
                            status = true, -- Se o sistema ta ativo ou não
                            zone = false, -- Qual a zona que precisa ter dominada para boostar o farm. Exemplo: [ 'Armas', 'Municao' ou etc ]
                            bonus = 2 -- 2x Quantidade que o farm vai duplicar quando estiver com a zona dominada.
                        },
                        itensList = {
                            {item = 'linha', minAmount = 5, maxAmount = 10},
                            {item = 'tecido', minAmount = 5, maxAmount = 10},
                            {item = 'placa-metal', minAmount = 5, maxAmount = 10},
                            {item = 'cartaovirgem', minAmount = 5, maxAmount = 10},
                        }
                    },
                    -- {
                    --     dangerRoute = {
                    --         status = false, -- Rota Perigosa ( CHANCE DE CHAMAR A POLICIA )
                    --         percentualPolice = 30 -- 3% De chamar A Policia ( APENAS SE O DangerRoute For ativo )
                    --     },
                    --     dominationBonus = {
                    --         -- Caso utilize o script mirtin_dominacao e queira dobrar/triplicar o farm se tiver a zona dominada.
                    --         status = true, -- Se o sistema ta ativo ou não
                    --         zone = false, -- Qual a zona que precisa ter dominada para boostar o farm. Exemplo: [ 'Armas', 'Municao' ou etc ]
                    --         bonus = 2 -- 2x Quantidade que o farm vai duplicar quando estiver com a zona dominada.
                    --     },
                    --     itensList = {
                    --         {item = 'contador', minAmount = 3, maxAmount = 6},
                    --         {item = 'linha', minAmount = 3, maxAmount = 6},
                    --         {item = 'polvora', minAmount = 3, maxAmount = 6},
                    --     }
                    -- },
                   
                }
            },
            delivery = {
                list = {
                    {
                        dangerRoute = {
                            status = true, -- Rota Perigosa ( CHANCE DE CHAMAR A POLICIA )
                            percentualPolice = 50 -- 3% De chamar A Policia ( APENAS SE O DangerRoute For ativo )
                        },
                        itensList = {
                            {item = 'cocaina', minAmount = 5, maxAmount = 10, type = 'ilegal', payment = 1260}, -- ( TYPE legal = dinheiro normal, ilegal = dinheiro sujo) ( payment valor por unidade )
                            {item = 'maconha', minAmount = 5, maxAmount = 10, type = 'ilegal', payment = 1260} -- ( TYPE legal = dinheiro normal, ilegal = dinheiro sujo) ( payment valor por unidade )
                        }
                    },
                    -- 
                }
            },
            locations = {
                -- LOCALIZACOES DESSAS BANCADAS
                {
                    -- POSSIVEL ADICIONAR VARIAS LOCALIZACOES E VARIAS ORGANIZACOES DIFERENTE
                    name = 'Vanilla',
                    coords = vec3(108.45,-1305.94,28.76), -- COORDENADAS DA BANCADA
                    requireStorage = {
                        -- SE VAI PUXAR OS ITENS DO ARMAZEM NA HORA DE FABRICAR ( Caso for true configurar na parte Storages )
                        active = true,
                        name = 'Vanilla'
                    },
                    tablePermission = 'perm.vanilla', -- PERMISSAO PARA ACESSAR A BANCADA
                    craftPermission = 'perm.lidervanilla', -- PERMISSAO PARA CRAFTAR ITEM
                    drawMarker = function(coords, dist)
                        if dist <= 5.0 then
                            DrawText3Ds(
                                coords.x,
                                coords.y,
                                coords.z + 0.1,
                                'Pressione ~p~[E]~w~ para acessar a bancada.'
                            )
                            DrawMarker(
                                27,
                                coords.x,
                                coords.y,
                                coords.z - 0.95,
                                0,
                                0,
                                0,
                                0,
                                0,
                                0,
                                1.5,
                                1.5,
                                1.5,
                                132,
                                102,
                                226,
                                180,
                                0,
                                0,
                                0,
                                1
                            )
                        end
                    end -- BLIP DO CHAO
                },
                -- LOCALIZACOES DESSAS BANCADAS
                {
                    -- POSSIVEL ADICIONAR VARIAS LOCALIZACOES E VARIAS ORGANIZACOES DIFERENTE
                    name = 'Bahamas',
                    coords = vec3(-1365.56, -616.79, 30.32), -- COORDENADAS DA BANCADA
                    requireStorage = {
                        -- SE VAI PUXAR OS ITENS DO ARMAZEM NA HORA DE FABRICAR ( Caso for true configurar na parte Storages )
                        active = true,
                        name = 'Bahamas'
                    },
                    tablePermission = 'perm.bahamas', -- PERMISSAO PARA ACESSAR A BANCADA
                    craftPermission = 'perm.liderbahamas', -- PERMISSAO PARA CRAFTAR ITEM
                    drawMarker = function(coords, dist)
                        if dist <= 5.0 then
                            DrawText3Ds(
                                coords.x,
                                coords.y,
                                coords.z + 0.1,
                                'Pressione ~p~[E]~w~ para acessar a bancada.'
                            )
                            DrawMarker(
                                27,
                                coords.x,
                                coords.y,
                                coords.z - 0.95,
                                0,
                                0,
                                0,
                                0,
                                0,
                                0,
                                1.5,
                                1.5,
                                1.5,
                                132,
                                102,
                                226,
                                180,
                                0,
                                0,
                                0,
                                1
                            )
                        end
                    end -- BLIP DO CHAO
                },

            }
        }, -- FIM DE UMA BANCADA



        -- ##########################
        -- #######|  testes  |#######
        -- ##########################
        
        
        
        ['Restaurante'] = {
            craft = {
                -- ZONA DE CRAFT
                {
                    item = 'cafe_com_leite', -- SPAWN DO ITEM
                    amount = 1, -- Quantidade de item que vai receber por unidade selecionada.
                    itemTime = 15, -- 30 segundo(s) para a maquina concluir o craft.
                    requires = {
                        -- ITENS NECESSARIOS PARA O CRAFT
                        { item = "leite_de_gado" , amount = 35 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                        { item = "graos_de_cafe" , amount = 35 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                    }
                },
                {
                    item = 'sanduiche', -- SPAWN DO ITEM
                    amount = 1, -- Quantidade de item que vai receber por unidade selecionada.
                    itemTime = 20, -- 30 segundo(s) para a maquina concluir o craft.
                    requires = {
                        -- ITENS NECESSARIOS PARA O CRAFT
                        { item = "carnedegado" , amount = 25 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                        { item = "farinha_de_trigo" , amount = 20 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                        { item = "sal" , amount = 20 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                        { item = "queijo" , amount = 20 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                    }
                },
                {
                    item = 'marmita', -- SPAWN DO ITEM
                    amount = 1, -- Quantidade de item que vai receber por unidade selecionada.
                    itemTime = 30, -- 30 segundo(s) para a maquina concluir o craft.
                    requires = {
                        -- ITENS NECESSARIOS PARA O CRAFT
                        { item = "carnedegado" , amount = 25 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                        { item = "arroz" , amount = 20 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                        { item = "feijao" , amount = 20 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                    }
                },
                {
                    item = 'sucol', -- SPAWN DO ITEM
                    amount = 1, -- Quantidade de item que vai receber por unidade selecionada.
                    itemTime = 10, -- 30 segundo(s) para a maquina concluir o craft.
                    requires = {
                        -- ITENS NECESSARIOS PARA O CRAFT
                        { item = "laranja" , amount = 25 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                        { item = "acucar" , amount = 20 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                        
                    }
                },
                {
                    item = 'sucol2', -- SPAWN DO ITEM
                    amount = 1, -- Quantidade de item que vai receber por unidade selecionada.
                    itemTime = 10, -- 30 segundo(s) para a maquina concluir o craft.
                    requires = {
                        -- ITENS NECESSARIOS PARA O CRAFT
                        { item = "limao" , amount = 25 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                        { item = "acucar" , amount = 20 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                        
                    }
                },
                {
                    item = 'cachorroq', -- SPAWN DO ITEM
                    amount = 1, -- Quantidade de item que vai receber por unidade selecionada.
                    itemTime = 20, -- 30 segundo(s) para a maquina concluir o craft.
                    requires = {
                        -- ITENS NECESSARIOS PARA O CRAFT
                        { item = "embutidos" , amount = 25 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                        { item = "farinha_de_trigo" , amount = 20 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                        { item = "sal" , amount = 20 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                        
                    }
                },
                {
                    item = 'pizza', -- SPAWN DO ITEM
                    amount = 1, -- Quantidade de item que vai receber por unidade selecionada.
                    itemTime = 30, -- 30 segundo(s) para a maquina concluir o craft.
                    requires = {
                        -- ITENS NECESSARIOS PARA O CRAFT
                        { item = "embutidos" , amount = 25 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                        { item = "farinha_de_trigo" , amount = 20 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                        { item = "sal" , amount = 20 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                        { item = "queijo" , amount = 20 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                        
                    }
                },
                
               

            },
            farm = {
                -- ZONA DE FARM
                list = {
                    {
                        dangerRoute = {
                            status = false, -- Rota Perigosa ( CHANCE DE CHAMAR A POLICIA )
                            percentualPolice = 30 -- 3% De chamar A Policia ( APENAS SE O DangerRoute For ativo )
                        },
                        dominationBonus = {
                            -- Caso utilize o script mirtin_dominacao e queira dobrar/triplicar o farm se tiver a zona dominada.
                            status = true, -- Se o sistema ta ativo ou não
                            zone = false, -- Qual a zona que precisa ter dominada para boostar o farm. Exemplo: [ 'Armas', 'Municao' ou etc ]
                            bonus = 2 -- 2x Quantidade que o farm vai duplicar quando estiver com a zona dominada.
                        },
                        itensList = {
                            {item = 'leite_de_gado', minAmount = 5, maxAmount = 10},
                            {item = 'graos_de_cafe', minAmount = 5, maxAmount = 10},
                            {item = 'farinha_de_trigo', minAmount = 5, maxAmount = 10},
                            {item = 'acucar', minAmount = 5, maxAmount = 10},
                        }
                    },
                    {
                        dangerRoute = {
                            status = false, -- Rota Perigosa ( CHANCE DE CHAMAR A POLICIA )
                            percentualPolice = 30 -- 3% De chamar A Policia ( APENAS SE O DangerRoute For ativo )
                        },
                        dominationBonus = {
                            -- Caso utilize o script mirtin_dominacao e queira dobrar/triplicar o farm se tiver a zona dominada.
                            status = true, -- Se o sistema ta ativo ou não
                            zone = false, -- Qual a zona que precisa ter dominada para boostar o farm. Exemplo: [ 'Armas', 'Municao' ou etc ]
                            bonus = 2 -- 2x Quantidade que o farm vai duplicar quando estiver com a zona dominada.
                        },
                        itensList = {
                            {item = 'limao', minAmount = 5, maxAmount = 10},
                            {item = 'laranja', minAmount = 5, maxAmount = 10},
                            {item = 'carnedegado', minAmount = 5, maxAmount = 10},
                            {item = 'sal', minAmount = 5, maxAmount = 10},
                        }
                    },
                    {
                        dangerRoute = {
                            status = false, -- Rota Perigosa ( CHANCE DE CHAMAR A POLICIA )
                            percentualPolice = 30 -- 3% De chamar A Policia ( APENAS SE O DangerRoute For ativo )
                        },
                        dominationBonus = {
                            -- Caso utilize o script mirtin_dominacao e queira dobrar/triplicar o farm se tiver a zona dominada.
                            status = true, -- Se o sistema ta ativo ou não
                            zone = false, -- Qual a zona que precisa ter dominada para boostar o farm. Exemplo: [ 'Armas', 'Municao' ou etc ]
                            bonus = 2 -- 2x Quantidade que o farm vai duplicar quando estiver com a zona dominada.
                        },
                        itensList = {
                            {item = 'arroz', minAmount = 5, maxAmount = 10},
                            {item = 'feijao', minAmount = 5, maxAmount = 10},
                            {item = 'queijo', minAmount = 5, maxAmount = 10},
                            {item = 'embutidos', minAmount = 5, maxAmount = 10},
                        }
                    },
                    
                   
                }
            },
            delivery = {
                list = {
                    {
                        dangerRoute = {
                            status = true, -- Rota Perigosa ( CHANCE DE CHAMAR A POLICIA )
                            percentualPolice = 50 -- 3% De chamar A Policia ( APENAS SE O DangerRoute For ativo )
                        },
                        itensList = {
                            {item = 'cocaina', minAmount = 5, maxAmount = 10, type = 'ilegal', payment = 1260}, -- ( TYPE legal = dinheiro normal, ilegal = dinheiro sujo) ( payment valor por unidade )
                            {item = 'maconha', minAmount = 5, maxAmount = 10, type = 'ilegal', payment = 1260} -- ( TYPE legal = dinheiro normal, ilegal = dinheiro sujo) ( payment valor por unidade )
                        }
                    },
                    
                }
            },
            locations = {
                -- LOCALIZACOES DESSAS BANCADAS
                {
                    -- POSSIVEL ADICIONAR VARIAS LOCALIZACOES E VARIAS ORGANIZACOES DIFERENTE
                    name = 'CatCafe',
                    coords = vec3(-590.42,-1063.04,22.36), -- COORDENADAS DA BANCADA
                    requireStorage = {
                        -- SE VAI PUXAR OS ITENS DO ARMAZEM NA HORA DE FABRICAR ( Caso for true configurar na parte Storages )
                        active = true,
                        name = 'CatCafe'
                    },
                    tablePermission = 'perm.catcafe', -- PERMISSAO PARA ACESSAR A BANCADA
                    craftPermission = 'perm.lidercatcafe', -- PERMISSAO PARA CRAFTAR ITEM
                    drawMarker = function(coords, dist)
                        if dist <= 5.0 then
                            DrawText3Ds(
                                coords.x,
                                coords.y,
                                coords.z + 0.1,
                                'Pressione ~p~[E]~w~ para acessar a bancada.'
                            )
                            DrawMarker(
                                27,
                                coords.x,
                                coords.y,
                                coords.z - 0.95,
                                0,
                                0,
                                0,
                                0,
                                0,
                                0,
                                1.5,
                                1.5,
                                1.5,
                                132,
                                102,
                                226,
                                180,
                                0,
                                0,
                                0,
                                1
                            )
                        end
                    end -- BLIP DO CHAO
                },
                -- LOCALIZACOES DESSAS BANCADAS
               

            }
        }, -- FIM DE
        
        
        
        
        
        
        
        
        
        -- ##########################
        -- #######|  testes  |#######
        -- ##########################












    }, -- FIM DA  CONFIGURACAO


    

    -- CONFIGURACAO DOS ARMAZENS
    Storages = {
        ---Armas
        ['Mafia'] = copyTable(weapon_items),

        ['Verdes'] = copyTable(weapon_items),

        -- Munição
        ['Cartel'] = copyTable(munition_items),

        ['Medelin'] = copyTable(munition_items),

        ['Vermelhos'] = copyTable(munition_items),

        ['Roxos'] = copyTable(munition_items),

        ---Desmanche
        ['Bennys'] = copyTable(dismantling_items),

        ['Franca'] = copyTable(dismantling_items),

        ---LAVAGEM
        ['Laranjas'] = copyTable(washing_itens),

        ['Vanilla'] = copyTable(washing_itens),

        ['Bahamas'] = copyTable(washing_itens),

        ['CatCafe'] = copyTable(food_itens),

    }, -- final do storages







    -- LOCALIZAÇÕES DAS ROTAS DE COLETA
    Locations = {
        ['SUL'] = {
            {['x'] = 269.72659301758, ['y'] = -433.30996704102, ['z'] = 45.258628845215},
            {['x'] = 1095.2623291016, ['y'] = -265.18560791016, ['z'] = 69.314659118652},
            {['x'] = 1215.4553222656, ['y'] = -1381.8483886719, ['z'] = 35.360610961914},
            {['x'] = 1149.3568115234, ['y'] = -2506.0375976563, ['z'] = 33.346450805664},
            {['x'] = 155.51463317871, ['y'] = -3038.2861328125, ['z'] = 7.0317249298096},
            {['x'] = 174.5284576416, ['y'] = -2025.7756347656, ['z'] = 18.331029891968},
            {['x'] = 184.11695861816, ['y'] = -1256.9632568359, ['z'] = 29.198429107666},
            {['x'] = 58.734958648682, ['y'] = -269.14291381836, ['z'] = 48.188236236572},
            {['x'] = -994.46783447266, ['y'] = 92.465660095215, ['z'] = 51.955184936523},
            {['x'] = -1998.3210449219, ['y'] = 540.85241699219, ['z'] = 109.51490783691},
            {['x'] = -1599.8289794922, ['y'] = -370.38012695313, ['z'] = 44.385177612305},
            {['x'] = -2187.79296875, ['y'] = -408.98895263672, ['z'] = 13.147369384766},
            {['x'] = -1329.2437744141, ['y'] = -1150.451171875, ['z'] = 4.38121509552},
            {['x'] = -508.26608276367, ['y'] = -1212.435546875, ['z'] = 18.596347808838},
            {['x'] = -917.13891601563, ['y'] = -1820.6671142578, ['z'] = 23.339479446411},
            {['x'] = 11.778308868408, ['y'] = -2054.2321777344, ['z'] = 10.360652923584},
            {['x'] = -733.16345214844, ['y'] = -1726.1092529297, ['z'] = 28.955078125},
            {['x'] = -838.60534667969, ['y'] = -609.32543945313, ['z'] = 29.026960372925},
            {['x'] = -448.94778442383, ['y'] = -132.73837280273, ['z'] = 39.08292388916},
            {['x'] = -195.33979797363, ['y'] = -835.03845214844, ['z'] = 30.730991363525}
        },
        ['NORTE'] = {
           
            { ['x'] = -2077.46, ['y'] = -371.96, ['z'] = 11.61 },
            { ['x'] = -3063.38, ['y'] = 670.5, ['z'] = 11.26 },
            { ['x'] = -2684.0, ['y'] = 2417.2, ['z'] = 16.16 },
            { ['x'] = -2751.79, ['y'] = 3473.46, ['z'] = 10.77 },
            { ['x'] = -2204.32, ['y'] = 4254.33, ['z'] = 47.04 },
            { ['x'] = -1482.71, ['y'] = 5011.22, ['z'] = 62.21 },
            { ['x'] = -212.5, ['y'] = 6317.23, ['z'] = 30.89 },
            { ['x'] = 172.16, ['y'] = 6711.8, ['z'] = 38.42 },
            { ['x'] = 2123.1, ['y'] = 6019.94, ['z'] = 50.62 },
            { ['x'] = 2383.86, ['y'] = 5131.86, ['z'] = 46.84 },
            { ['x'] = 1691.91, ['y'] = 4665.01, ['z'] = 42.83 },
            { ['x'] = 2614.41, ['y'] = 4764.1, ['z'] = 33.14 },
            { ['x'] = 2738.67, ['y'] = 4398.37, ['z'] = 48.26 },
            { ['x'] = 2112.02, ['y'] = 3621.93, ['z'] = 38.23 },
            { ['x'] = 2286.26, ['y'] = 3012.33, ['z'] = 45.65 },
            { ['x'] = 1520.81, ['y'] = 3741.62, ['z'] = 34.0 },
            { ['x'] = 407.54, ['y'] = 3564.94, ['z'] = 32.97 },
            { ['x'] = 279.39, ['y'] = 2648.87, ['z'] = 44.13 },
            { ['x'] = -742.03, ['y'] = 2801.08, ['z'] = 25.44 },
            { ['x'] = -2809.78, ['y'] = 2216.93, ['z'] = 27.31 },
            { ['x'] = -1882.68, ['y'] = -554.67, ['z'] = 11.17 },
        }
    },
    -- LOCALIZAÇÕES DAS ENTREGAS
    DeliveryLocations = { 
        {['x'] = 727.77172851563, ['y'] = 216.70178222656, ['z'] = 87.030082702637},
        {['x'] = 200.47122192383, ['y'] = 495.94183349609, ['z'] = 140.99989318848},
        {['x'] = -184.89025878906, ['y'] = 502.69140625, ['z'] = 134.91850280762},
        {['x'] = -355.51943969727, ['y'] = 343.93936157227, ['z'] = 109.34753417969},
        {['x'] = -568.55474853516, ['y'] = 494.0881652832, ['z'] = 106.95864105225},
        {['x'] = -836.76580810547, ['y'] = 454.63809204102, ['z'] = 88.595893859863},
        {['x'] = -1161.8542480469, ['y'] = 480.41220092773, ['z'] = 86.093757629395},
        {['x'] = -1455.5434570313, ['y'] = 413.61660766602, ['z'] = 109.88622283936},
        {['x'] = -1481.2939453125, ['y'] = -7.4827694892883, ['z'] = 55.236015319824},
        {['x'] = -1149.9549560547, ['y'] = -388.05087280273, ['z'] = 36.635585784912},
        {['x'] = -895.76831054688, ['y'] = -779.05114746094, ['z'] = 15.910481452942},
        {['x'] = -870.94580078125, ['y'] = -1129.8197021484, ['z'] = 7.0695457458496},
        {['x'] = -1138.6221923828, ['y'] = -1410.21484375, ['z'] = 5.2557005882263},
        {['x'] = -1351.5860595703, ['y'] = -1216.1368408203, ['z'] = 5.944146156311},
        {['x'] = -1012.6721801758, ['y'] = -1138.9058837891, ['z'] = 2.1586010456085},
        {['x'] = -1315.2711181641, ['y'] = -903.45721435547, ['z'] = 11.322186470032},
        {['x'] = -1586.9901123047, ['y'] = -571.14691162109, ['z'] = 34.97908782959},
        {['x'] = -1997.5615234375, ['y'] = -334.21292114258, ['z'] = 48.106292724609},
        {['x'] = -1630.5080566406, ['y'] = -361.54281616211, ['z'] = 48.140926361084},
        {['x'] = -2235.0270996094, ['y'] = -362.39163208008, ['z'] = 13.311479568481},
        {['x'] = -2819.4743652344, ['y'] = 64.266174316406, ['z'] = 14.754144668579},
        {['x'] = -3031.900390625, ['y'] = 516.42614746094, ['z'] = 7.3950986862183},
        {['x'] = -3224.7846679688, ['y'] = 1098.7489013672, ['z'] = 10.571074485779},
        {['x'] = -3008.2175292969, ['y'] = 1912.2239990234, ['z'] = 28.482349395752},
        {['x'] = -2520.0417480469, ['y'] = 2315.4816894531, ['z'] = 33.216365814209},
        {['x'] = -2351.4899902344, ['y'] = 3994.7272949219, ['z'] = 26.699678421021},
        {['x'] = -1491.5766601563, ['y'] = 4980.5122070313, ['z'] = 63.323047637939},
        {['x'] = -581.72552490234, ['y'] = 5621.5712890625, ['z'] = 38.658626556396},
        {['x'] = -182.99453735352, ['y'] = 6311.8110351563, ['z'] = 31.489393234253},
        {['x'] = 756.95104980469, ['y'] = 6461.7241210938, ['z'] = 31.427434921265},
        {['x'] = 1745.1613769531, ['y'] = 6411.2065429688, ['z'] = 35.239028930664},
        {['x'] = 2559.6745605469, ['y'] = 5241.7177734375, ['z'] = 44.855991363525},
        {['x'] = 1959.9293212891, ['y'] = 5172.603515625, ['z'] = 47.927612304688},
        {['x'] = 1819.3823242188, ['y'] = 4588.7680664063, ['z'] = 36.047267913818},
        {['x'] = 2667.91015625, ['y'] = 4763.7509765625, ['z'] = 34.724266052246},
        {['x'] = 2845.0456542969, ['y'] = 3436.298828125, ['z'] = 50.762619018555},
        {['x'] = 2538.9609375, ['y'] = 2572.9411621094, ['z'] = 37.944816589355},
        {['x'] = 2333.9645996094, ['y'] = 1196.4398193359, ['z'] = 64.543518066406},
        {['x'] = 2276.1181640625, ['y'] = -487.01263427734, ['z'] = 81.982582092285},
        {['x'] = 1001.8076171875, ['y'] = -813.86273193359, ['z'] = 33.975234985352},
        {['x'] = 91.650726318359, ['y'] = -1209.86328125, ['z'] = 37.548927307129},
        {['x'] = 474.55722045898, ['y'] = -1062.0173339844, ['z'] = 29.211532592773},
        {['x'] = 493.51379394531, ['y'] = -583.89660644531, ['z'] = 24.714595794678},
        {['x'] = 633.35852050781, ['y'] = -291.8196105957, ['z'] = 39.99861907959},
        {['x'] = 936.87609863281, ['y'] = -875.10345458984, ['z'] = 43.794380187988},
        {['x'] = 767.81390380859, ['y'] = -1318.5142822266, ['z'] = 27.275230407715},
        {['x'] = 765.59387207031, ['y'] = -1901.9017333984, ['z'] = 29.173307418823},
        {['x'] = 421.52984619141, ['y'] = -1543.0887451172, ['z'] = 29.249750137329},
        {['x'] = 26.712888717651, ['y'] = -1458.2862548828, ['z'] = 30.478290557861},
        {['x'] = -425.20614624023, ['y'] = -1699.0222167969, ['z'] = 19.079179763794},
        {['x'] = -76.685134887695, ['y'] = -1313.3244628906, ['z'] = 29.260971069336},
        {['x'] = -253.92417907715, ['y'] = -944.14013671875, ['z'] = 31.219984054565},
        {['x'] = -663.40991210938, ['y'] = -890.51904296875, ['z'] = 24.578384399414},
        {['x'] = -703.26116943359, ['y'] = -1390.6459960938, ['z'] = 5.1502690315247},
        {['x'] = -549.00323486328, ['y'] = -939.03460693359, ['z'] = 23.852233886719},
        {['x'] = -829.84509277344, ['y'] = -623.87945556641, ['z'] = 29.026956558228},
        {['x'] = -900.43634033203, ['y'] = -195.82566833496, ['z'] = 38.067127227783},
        {['x'] = -352.57220458984, ['y'] = 14.588917732239, ['z'] = 47.854736328125},
        {['x'] = -33.800872802734, ['y'] = -23.058477401733, ['z'] = 68.997619628906},
        {['x'] = 290.91644287109, ['y'] = -293.37322998047, ['z'] = 53.981533050537}
    },
}

-- OUTRAS CONFIGURAÇÕES
if not SERVER then
    function DrawText3Ds(x, y, z, text)
        local onScreen, _x, _y = World3dToScreen2d(x, y, z)
        SetTextFont(4)
        SetTextScale(0.35, 0.35)
        SetTextColour(255, 255, 255, 200)
        SetTextEntry('STRING')
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x, _y)
    end
end
