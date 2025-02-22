require("dotenv").config({
  path: `../../../.env`,
})

module.exports = {
  siteMetadata: {
    title: `Quantum`,
    description: `Kick off your next, great Gatsby project with this default starter. This barebones starter ships with the main Gatsby configuration files you might need.`,
    author: `@gatsbyjs`,
    siteUrl: `https://gatsbystarterdefaultsource.gatsbyjs.io/`,
  },
  plugins: [
    {
      resolve: "gatsby-plugin-theme-ui",
      options: {
        prismPreset: "night-owl",
      },
    },
    "gatsby-plugin-image",
    "gatsby-plugin-react-helmet",
    "gatsby-plugin-sitemap",
    "gatsby-plugin-drupal-menus",
    "gatsby-plugin-no-sourcemaps",
    // `gatsby-plugin-perf-budgets`,
    // `gatsby-plugin-webpack-bundle-analyser-v2`,
    {
      resolve: `gatsby-source-drupal`,
      options: {
        baseUrl: process.env.GATSBY_DRUPAL_HOST + `/`,
        skipFileDownloads: true,
        params: {
          "api-key": process.env.GATSBY_DRUPAL_KEY, // any valid key value pair here
        },
      },
    },
    {
      resolve: "gatsby-plugin-manifest",
      options: {
        icon: "src/images/icon.png",
      },
    },
    "gatsby-plugin-sharp",
    "gatsby-transformer-sharp",
    {
      resolve: "gatsby-source-filesystem",
      options: {
        name: "images",
        path: "./src/images/",
      },
      __key: "images",
    },
    "gatsby-theme-tina-edit",
    "gatsby-theme-drupal-admin",
  ],
}
