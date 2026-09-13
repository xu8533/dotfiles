return {
    "devilsakuya/nvim-translate",
    lazy = true,
    keys = {
        { "<localleader>xx", "<cmd>Translate<cr>", desc = "Translate", mode = { "n", "x" } },
    },
    opts = {
        api_key = function()
            return os.getenv("SILICONFLOW_API_KEY")
        end,
        base_url = "https://api.siliconflow.cn/v1",
        model = "tencent/Hunyuan-MT-7B",
        prompt = "自动识别源语言，默认中英互译，若为单个英文单词，则额外返回英标",
        trigger_key = "<localleader>xx",
    },
}
