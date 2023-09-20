return {
    "xeluxee/competitest.nvim",
    dependencies = "MunifTanjim/nui.nvim",
    config = function()
        require("competitest").setup({
            save_current_file = true,
            compile_directory = ".",
            compile_command = {
                c = { exec = "gcc", args = { "-Wall", "$(FNAME)", "-o", "$(FNOEXT)" } },
                cpp = { exec = "g++", args = { "-Wall", "$(FNAME)", "-o", "$(FNOEXT)" } },
                rust = { exec = "rustc", args = { "$(FNAME)" } },
                java = { exec = "javac", args = { "$(FNAME)" } },
            },
            running_directory = ".",
            run_command = {
                c = { exec = "./$(FNOEXT)" },
                cpp = { exec = "./$(FNOEXT)" },
                rust = { exec = "./$(FNOEXT)" },
                python = { exec = "python", args = { "$(FNAME)" } },
                java = { exec = "java", args = { "$(FNOEXT)" } },
            },
            multiple_testing = -1,
            view_output_diff = true,

            testcases_directory = "./tests/",
            testcases_input_file_format = "$(TCNUM).in",
            testcases_output_file_format = "$(TCNUM).out",

            template_file = "~/OI/.templates/template.$(FEXT)",
            received_problems_path = "$(HOME)/OI/$(JUDGE)/$(CONTEST)/$(PROBLEM).$(FEXT)",
            received_contests_directory = "$(HOME)/OI/$(JUDGE)/$(CONTEST)",
            received_contests_problems_path = "$(PROBLEM)/main.$(FEXT)",
            evaluate_template_modifiers = true,
        })
    end,
}
