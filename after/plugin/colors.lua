
function ColorMyPencils(color)
	color = color or "neon"
	vim.cmd.colorscheme(color)
end

ColorMyPencils()
