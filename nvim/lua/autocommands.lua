local langmap_group = vim.api.nvim_create_augroup("ChangeLangmap", { clear = true  })

vim.api.nvim_create_autocmd("InsertEnter", { command = "set langmap=", group = langmap_group })
vim.api.nvim_create_autocmd("InsertLeave", { command = "set langmap=il,li,IL,LI,je,JE,ek,EK,kn,KN,nj,NJ", group = langmap_group })

