// Platform fonts keep local renders independent of Google Fonts connectivity.
// For branded deliveries, bundle licensed fonts in public/ and use @font-face.
export const loadSansFont = (_style: string, _options: unknown) => ({
  fontFamily: '"Segoe UI", "Microsoft YaHei", Arial, sans-serif',
});
export const loadSerifFont = (_style: string, _options: unknown) => ({
  fontFamily: 'Georgia, "SimSun", serif',
});
