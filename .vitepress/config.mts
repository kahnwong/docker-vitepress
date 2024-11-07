import { defineConfig } from "vitepress";
import { generateSidebar } from "vitepress-sidebar";

export default defineConfig({
  themeConfig: {
    nav: [
      {
        text: "Notes",
        link: "/notes/Landing",
      },
    ],

    sidebar: {
      "/notes/": generateSidebar({
        scanStartPath: "/notes",
        useTitleFromFileHeading: true,
      }),
    },
  }
});
