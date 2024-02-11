return {
    {
        "stevearc/vim-arduino",
        dependencies = {
            "stevearc/dressing.nvim"
        },
        lazy = false,
        setup = function()
            vim.cmd("command! -bar -nargs=? ArduinoAttach call arduino#Attach(<f-args>)");
            vim.cmd("command! -bar -nargs=? ArduinoChooseBoard call arduino#ChooseBoard(<f-args>)");
            vim.cmd("command! -bar -nargs=? ArduinoChooseProgrammer call arduino#ChooseProgrammer(<f-args>)");
            vim.cmd("command! -bar ArduinoVerify call arduino#Verify()");
            vim.cmd("command! -bar ArduinoUpload call arduino#Upload()");
            vim.cmd("command! -bar ArduinoSerial call arduino#Serial()");
            vim.cmd("command! -bar ArduinoUploadAndSerial call arduino#UploadAndSerial()");
            vim.cmd("command! -bar ArduinoGetInfo call arduino#GetInfo()");
            vim.cmd("command! -bar -nargs=? ArduinoChoosePort call arduino#ChoosePort(<f-args>)");
            vim.cmd("command! -bar -nargs=1 ArduinoSetBaud call arduino#SetBaud(<f-args>)");
            -- vim.api.nvim_create_user_command("ArduinoAttach", "<cmd>arduino#Attach(<f-args>)")
        end
    },
    {
        "vlelo/arduino-helper.nvim",
        config = function()
            require("arduino-helper").setup {
                ui = "telescope",
            }
        end
    }
}
