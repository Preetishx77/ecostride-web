List<String> availableCalcValues = ["🚗 Vehicle", "📺 Appliances", "⚡️ Electricity", "⛽️ Fuel"];

String getExpressionString(double cf) {
  if (cf > 4) {
    return "Oh No! 🫣";
  } else {
    return "Yayy! 🥳";
  }
}

String getExpressionMessage(double cf) {
  if (cf > 4) {
    return "Alert 🚨! You're generating above the global average.\nBe conscious and make others as well 📣";
  } else {
    return "Kudos 👏🏻! You're generating below the global average.\nSpread the word today 📣";
  }
}

List<String> topQuestions = [
  "What are Carbon offsets? How can I get them? And how and where can it be used?",
  "How can Carbon offsets be traded with orgs?",
];

List<String> blogUrls = [
  "https://www.newyorker.com/magazine/2023/10/23/the-great-cash-for-carbon-hustle",
  "https://www.spglobal.com/commodityinsights/en/market-insights/blogs/energy-transition/061021-voluntary-carbon-markets-pricing-participants-trading-corsia-credits",
  "https://terrapass.com/the-footprint-blog/",
  "https://greenly.earth/en-us/blog/company-guide/what-is-carbon-offsetting-and-removal",
];

List<String> videoUrls = [
  "https://www.youtube.com/watch?v=m5ych9oDtk0",
  "https://www.cnn.com/videos/business/2021/09/23/carbon-offsetting-climate-change-explainer-mxb-lon-orig.cnn",
  "https://www.youtube.com/watch?v=b1xHUwszumw"
];

List<String> mixedUrls = [
  "https://www.newyorker.com/magazine/2023/10/23/the-great-cash-for-carbon-hustle",
  "https://www.youtube.com/watch?v=b1xHUwszumw",
  "https://greenly.earth/en-us/blog/company-guide/what-is-carbon-offsetting-and-removal",
];
