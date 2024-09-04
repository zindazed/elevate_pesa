import 'package:elevate_pesa/pages/exploreDetail.dart';
import 'package:flutter/material.dart';

class ExplorePage extends StatefulWidget {
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      // backgroundColor: Colors.white,
      // elevation: 0,
      // title: TextField(
      //   decoration: InputDecoration(
      //     prefixIcon: Icon(Icons.search),
      //     hintText: 'Search...',
      //     border: OutlineInputBorder(
      //       borderRadius: BorderRadius.circular(30.0),
      //       borderSide: BorderSide.none,
      //     ),
      //     filled: true,
      //     fillColor: Colors.grey[200],
      //   ),
      // ),
      // actions: [
      //   IconButton(
      //     icon: Icon(Icons.notifications, color: Colors.black),
      //     onPressed: () {},
      //   ),
      //   CircleAvatar(
      //     backgroundImage: NetworkImage(
      //         'https://www.example.com/profile.jpg'), // Replace with a real image URL
      //   ),
      // ],
      // bottom:
      // ),
      body: Column(
        children: [
          Container(
            height: 60,
            child: TabBar(
              controller: _tabController,
              isScrollable: true,
              indicatorColor: Colors.blue,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(text: 'For you'),
                Tab(text: 'Investments'),
                Tab(text: 'Credit'),
                Tab(text: 'Fundraising'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                ForYouTab(),
                InvestmentsTab(),
                CreditTab(),
                FundraisingTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ForYouTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ArticleCard(
          title: 'How to Start Investing',
          content:
              "Welcome to the world of investing! If you're reading this, you've taken the first step towards securing your financial future. Investing can seem daunting at first, with its own unique language and a vast array of options. But don't worry, we're here to help you navigate this exciting journey.\n\nIn this guide, we'll break down the basics of investing and provide you with a roadmap to get started. We'll cover key topics such as understanding the different types of investments, setting financial goals, creating a diversified portfolio, and managing risk.\n\n1. Understanding Investing: At its core, investing is about putting your money to work today to grow its value for the future. We'll explain the concept of compound interest, the power of time in investing, and the importance of starting early.\n\n2. Types of Investments: Stocks, bonds, mutual funds, real estate, and more - the investment landscape is vast. We'll help you understand the pros and cons of each type, so you can make informed decisions.\n\n3.Setting Financial Goals: Whether you're saving for a house, your child's education, or retirement, having clear financial goals is crucial. We'll discuss how to set SMART (Specific, Measurable, Achievable, Relevant, Time-bound) goals.\n\n4. Creating a Diversified Portfolio: Diversification is a key strategy to manage risk in your investment portfolio. We'll guide you on how to spread your investments across various asset classes.\n\n5.Managing Risk: All investments come with some level of risk. We'll talk about understanding your risk tolerance and how to manage risk effectively.\n\n6. Getting Started: Finally, we'll walk you through the practical steps of opening a brokerage account, choosing your first investments, and regularly reviewing and adjusting your portfolio.\n\nRemember, investing is not a get-rich-quick scheme, but a long-term strategy for wealth creation. So, let's embark on this journey together, one step at a time. Happy investing!",
          imageUrl: 'p1.jpeg', // Replace with a real image URL
        ),
        TrendingCard(
          title: 'Top Investment Trends in 2024',
          content:
              "Discover the latest trends in the investment world and stay ahead of the curve with our guide to top investment trends in 2024.\n\n1. Sustainable and Socially Responsible Investing: As awareness about climate change and social issues grows, more investors are seeking opportunities that align with their values. Learn about sustainable and socially responsible investing and how it can benefit both your portfolio and the world.\n\n2. Technology and Innovation: With rapid advancements in technology, sectors like artificial intelligence, cybersecurity, and biotechnology are expected to offer promising investment opportunities. We'll explore these trends and how you can tap into them.\n\n3. Real Estate Investment Trusts (REITs): REITs have gained popularity as a means to invest in real estate without directly owning properties. We'll discuss the potential of REITs and what to look for when investing in them.\n\n4. Cryptocurrencies and Blockchain: Cryptocurrencies and blockchain technology continue to disrupt the financial landscape. We'll delve into the potential of these digital assets and how they might fit into your investment strategy.\n\n5. Emerging Markets: As economies in countries like India, China, and Brazil continue to grow, they present attractive investment opportunities. We'll examine the risks and rewards associated with investing in emerging markets.\n\n6. Alternative Investments: From art and collectibles to private equity and hedge funds, alternative investments can provide diversification and potential returns. We'll explore the pros and cons of these non-traditional investment options.\n\nStay informed about these top investment trends and position yourself for success in the ever-evolving world of investing. Happy exploring!",
          tweetCount: '10K',
          imageUrl: 'p2.jpeg', // Replace with a real image URL
        ),
        ArticleCard(
          title: 'Improving Your Credit Score',
          content:
              "Tips and strategies to boost your credit score and unlock better financial opportunities.\n\n1. Pay Bills on Time: Late payments negatively impact your credit score. Set reminders or automate payments to ensure you're never late.\n\n2. Reduce Credit Utilization: Aim to use less than 30% of your available credit. Lower credit utilization can lead to a higher credit score.\n\n3. Regularly Review Credit Reports: Check your credit reports for errors or inaccuracies that could be hurting your score. You're entitled to a free report from each credit bureau annually.\n\n4. Diversify Credit Types: Having a mix of credit types (e.g., credit cards, auto loans, mortgages) can positively affect your score.\n\n5. Limit New Credit Applications: Each application can cause a small, temporary dip in your score. Apply for new credit sparingly and only when necessary.\n\n6. Maintain Old Credit Accounts: The length of your credit history factors into your score. Keep old accounts open and active to demonstrate a longer history.\n\nImplementing these strategies consistently over time can help improve your credit score and open doors to better financial products and lower interest rates. Good luck on your credit improvement journey!",
          imageUrl: 'creditup.jpeg', // Replace with a real image URL
        ),
      ],
    );
  }
}

class InvestmentsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ArticleCard(
          title: 'Best Investment Strategies for Beginners',
          content:
              "Explore the top strategies for new investors to build a strong foundation for long-term wealth creation.\n\n1. Start with a Solid Financial Plan: Set clear financial goals, establish an emergency fund, and pay off high-interest debt before investing.\n\n2. Diversify Your Portfolio: Spread your investments across different asset classes to minimize risk. A diversified portfolio can help protect your investments during market downturns.\n\n3. Invest in Low-Cost Index Funds: Index funds offer broad market exposure at a low cost. They're ideal for beginners due to their simplicity and historical performance.\n\n4. Dollar-Cost Averaging: Invest a fixed amount regularly, regardless of market conditions. This strategy can help reduce the impact of market volatility on your investments.\n\n5. Focus on Long-Term Growth: Investing is a long-term game. Focus on the long-term potential of your investments and avoid the temptation to time the market.\n\n6. Regularly Review and Adjust Your Portfolio: Periodically review your investments to ensure they align with your financial goals. Make adjustments as needed to maintain a balanced portfolio.\n\nAdopting these strategies can help beginners navigate the investment landscape with confidence. Happy investing!",
          imageUrl: 'p4.jpeg', // Replace with a real image URL
        ),
        ArticleCard(
          title: 'Understanding Stock Markets',
          content:
              "A comprehensive guide to how stock markets work and how to navigate them effectively.\n\n1. What are Stock Markets?: Stock markets are platforms where publicly traded companies issue and trade shares. They enable investors to buy and sell shares, providing companies with access to capital and investors with the potential for returns.\n\n2. How Stock Markets Work: Learn about the mechanics of stock trading, including bids, asks, and order types. Understand how supply and demand influence stock prices.\n\n3. Types of Stocks: Discover the different types of stocks, such as common and preferred shares, and their respective benefits and drawbacks.\n\n4. Stock Market Indices: Explore major stock market indices like the S&P 500, Dow Jones Industrial Average, and NASDAQ Composite. Understand how they reflect the overall market performance.\n\n5. Factors Influencing Stock Prices: Learn about the various factors that can impact stock prices, including company earnings, economic indicators, and geopolitical events.\n\n6. Stock Analysis Techniques: Delve into fundamental and technical analysis, two popular methods for evaluating stocks and making informed investment decisions.\n\n7. Building a Stock Portfolio: Understand the importance of diversification, risk management, and long-term planning when constructing a stock portfolio.\n\nGaining a solid understanding of stock markets can empower you to make informed investment decisions and work towards your financial goals. Happy learning!",
          imageUrl: 'stockm.png', // Replace with a real image URL
        ),
        ArticleCard(
          title: 'Real Estate Investment Tips',
          content:
              "Learn how to invest in real estate successfully with these valuable tips and insights.\n\n1. Set Clear Investment Goals: Define your financial objectives, risk tolerance, and investment timeline before diving into real estate investing.\n\n2. Research the Market: Study local and national real estate trends, property values, rental rates, and economic indicators to identify promising investment opportunities.\n\n3. Choose a Real Estate Niche: Focus on a specific real estate niche, such as residential, commercial, or industrial properties, to develop expertise and improve decision-making.\n\n4. Understand Financing Options: Familiarize yourself with various financing options, including traditional mortgages, private lenders, and real estate investment trusts (REITs).\n\n5. Location, Location, Location: The old adage holds true – the location of a property significantly impacts its value and rental potential. Look for properties in desirable areas with strong growth prospects.\n\n6. Due Diligence: Thoroughly inspect properties, review financial statements, and assess potential risks before making an investment decision.\n\n7. Network with Professionals: Build relationships with real estate agents, attorneys, property managers, and other industry professionals to gain valuable insights and support.\n\n8. Continuous Learning: Stay updated on real estate trends, regulations, and best practices to refine your investment strategies and maximize returns.\n\nImplementing these tips can help you navigate the world of real estate investing with confidence and increase your chances of success. Happy investing!",
          imageUrl: 'p6.jpeg', // Replace with a real image URL
        ),
      ],
    );
  }
}

class CreditTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ArticleCard(
          title: 'Building Good Credit from Scratch',
          content:
              "Steps to build and maintain a good credit score:\n\n1. Open a Credit Account: Start with a secured credit card, student credit card, or become an authorized user on someone else's credit card.\n\n2. Use Credit Responsibly: Make small purchases and pay your balance in full and on time each month.\n\n3. Keep Credit Utilization Low: Aim to use less than 30% of your available credit to maintain a healthy credit utilization ratio.\n\n4. Diversify Credit Types: Gradually add different types of credit, such as auto loans or mortgages, to your credit mix.\n\n5. Monitor Your Credit: Regularly review your credit reports for accuracy and signs of fraud. Dispute any errors promptly.\n\n6. Be Patient: Building good credit takes time. Consistently practice good credit habits to see improvements over time.\n\nFollowing these steps can help you establish and maintain a strong credit score, opening doors to better financial opportunities.",
          imageUrl: 'gcredit.jpeg', // Replace with a real image URL
        ),
        ArticleCard(
          title: 'Credit Card Tips and Tricks',
          content:
              "Maximize the benefits of your credit cards with these tips and tricks:\n\n1. Pay Bills on Time: Late payments can result in fees and negatively impact your credit score.\n\n2. Utilize Rewards Programs: Take advantage of cash back, points, or miles programs offered by your credit card issuer.\n\n3. Avoid Unnecessary Fees: Be aware of annual fees, foreign transaction fees, and balance transfer fees. Choose a card with minimal fees or fees that align with your spending habits.\n\n4. Set Up Automatic Payments: Automate minimum or full payments to avoid late payments and potential interest charges.\n\n5. Keep Credit Utilization Low: Maintain a low balance relative to your credit limit to improve your credit utilization ratio.\n\n6. Regularly Review Statements: Monitor your credit card statements for accuracy, fraudulent charges, and potential billing errors.\n\n7. Negotiate Terms: Contact your credit card issuer to request lower interest rates, waived fees, or increased credit limits.\n\nImplementing these strategies can help you maximize the benefits of your credit cards while minimizing potential costs and risks.",
          imageUrl: 'gcredit2.jpeg', // Replace with a real image URL
        ),
        ArticleCard(
          title: 'Credit Score Myths Debunked',
          content:
              "Common misconceptions about credit scores debunked:\n\n1. Checking Your Credit Score Lowers It: Checking your own credit score is considered a soft inquiry, which does not affect your credit score.\n\n2. Income Determines Credit Score: Your income does not directly impact your credit score. It's your credit behavior that matters most.\n\n3. Closing Unused Credit Cards Boosts Your Score: Closing unused credit cards can actually hurt your score by reducing your available credit and shortening your credit history.\n\n4. Paying Off Debt Removes It from Your Credit Report: Paying off debt is positive, but the account history can remain on your credit report for up to seven years.\n\n5. Credit Scores are the Same for Everyone: Each person has unique credit scores based on their individual credit histories. Additionally, different credit scoring models may result in varying scores.\n\n6. You Only Have One Credit Score: There are multiple credit scoring models, and each model may generate a different credit score for you.\n\nUnderstanding these myths can help you make more informed decisions about your credit and better manage your financial health.",
          imageUrl: 'cgreditd.jpg', // Replace with a real image URL
        ),
      ],
    );
  }
}

class FundraisingTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ArticleCard(
          title: 'How to Start a Fundraising Campaign',
          content:
              "A step-by-step guide to successful fundraising:\n\n1. Define Your Goal: Clearly outline your fundraising objective, including the amount needed and the cause or project it supports.\n\n2. Identify Your Audience: Determine who is most likely to support your campaign, such as friends, family, or specific communities.\n\n3. Choose a Platform: Select a fundraising platform that aligns with your goals, audience, and campaign type.\n\n4. Create a Compelling Story: Craft a persuasive narrative that communicates the impact of your campaign and inspires potential donors to contribute.\n\n5. Set Up Your Campaign: Customize your fundraising page with visually appealing images, videos, and a clear explanation of your goal and story.\n\n6. Promote Your Campaign: Leverage social media, email, and other marketing channels to spread the word about your fundraiser.\n\n7. Maintain Momentum: Keep supporters engaged with regular updates, milestone celebrations, and expressions of gratitude.\n\n8. Follow Up: After your campaign, thank donors, share the results, and keep them informed about the impact of their contributions.\n\nFollowing these steps can help you create a successful fundraising campaign and make a meaningful difference for your cause.",
          imageUrl: 'p3.jpeg', // Replace with a real image URL
        ),
        // ArticleCard(
        //   title: 'Top Fundraising Platforms',
        //   content:
        //       "Review of the best platforms for fundraising:\n\n1. GoFundMe: A popular platform for personal causes, medical expenses, and community projects.\n\n2. Kickstarter: Ideal for creative projects, such as films, music, and art, with an all-or-nothing funding model.\n\n3. Indiegogo: Suitable for innovative ideas, startups, and entrepreneurial ventures, offering both flexible and fixed funding options.\n\n4. CrowdRise: Focused on charitable giving and nonprofit fundraising, with tools for events and peer-to-peer campaigns.\n\n5. Classy: Designed for nonprofits, offering customizable donation pages, event management, and peer-to-peer fundraising features.\n\n6. Bonfire: A platform for creating and selling custom merchandise to raise funds for various causes.\n\n7. Fundly: A versatile platform for personal, nonprofit, and community fundraising, with easy-to-use campaign creation tools.\n\nEach platform offers unique features and benefits. Choose the one that best aligns with your fundraising goals and audience.",
        //   imageUrl: 'p4.jpeg', // Replace with a real image URL
        // ),
        ArticleCard(
          title: 'Fundraising Success Stories',
          content:
              "Inspiring stories from successful fundraising campaigns:\n\n1. The Water Project: A nonprofit organization that raised over \$1 million to provide clean water to communities in sub-Saharan Africa.\n\n2. Charity: Water: Raised over \$3 million through a viral birthday campaign, where donors gave up their birthdays to fund clean water projects worldwide.\n\n3. Time's Up Legal Defense Fund: Raised over \$24 million to support victims of sexual harassment and assault in the workplace.\n\n4. Ice Bucket Challenge: A viral social media campaign that raised over \$115 million for ALS research and awareness.\n\n5. Save the Children: Raised over \$18 million through a peer-to-peer fundraising campaign to support children in crisis situations.\n\n6. Movember: A global campaign encouraging men to grow mustaches during November to raise funds and awareness for men's health issues.\n\nThese success stories demonstrate the power of effective fundraising campaigns to create meaningful change and inspire others to take action.",
          imageUrl: 'fundraisesuccess.jpeg', // Replace with a real image URL
        ),
      ],
    );
  }
}

class ArticleCard extends StatelessWidget {
  final String title;
  final String content;
  final String imageUrl;

  ArticleCard(
      {required this.title, required this.content, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailPage(
                    title: title,
                    content: content,
                    imageUrl: imageUrl,
                  )),
        );
      },
      child: Card(
        margin: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity, // Fill the entire width of the container
              height: 200, // Set a constant height (adjust as needed)
              child: Image.asset(
                'assets/properties/$imageUrl',
                fit: BoxFit
                    .cover, // Ensures the image covers the container while maintaining aspect ratio
              ),
            ), // Replace with a real image URL
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  Text(content, maxLines: 1, overflow: TextOverflow.ellipsis),
            ),
          ],
        ),
      ),
    );
  }
}

class TrendingCard extends StatelessWidget {
  final String title;
  final String content;
  final String tweetCount;
  final String imageUrl;

  TrendingCard(
      {required this.title,
      required this.content,
      required this.tweetCount,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailPage(
                    title: title,
                    content: content,
                    imageUrl: imageUrl,
                  )),
        );
      },
      child: Card(
        margin: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity, // Fill the entire width of the container
              height: 200, // Set a constant height (adjust as needed)
              child: Image.asset(
                'assets/properties/$imageUrl',
                fit: BoxFit
                    .cover, // Ensures the image covers the container while maintaining aspect ratio
              ),
            ), // Replace with a real image URL
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  Text(content, maxLines: 1, overflow: TextOverflow.ellipsis),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('$tweetCount people are tweeting about this',
                  style: TextStyle(color: Colors.grey)),
            ),
          ],
        ),
      ),
    );
  }
}
