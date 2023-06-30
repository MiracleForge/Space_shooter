/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
var isSurfaceSupported = surface_format_is_supported(surface_rgba16float);
application_surface_draw_enable(!isSurfaceSupported);
surf_light = -1;
ambient_light = make_color_rgb(255, 255, 255);

