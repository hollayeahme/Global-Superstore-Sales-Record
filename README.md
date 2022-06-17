## Case Study – Data Analysis of a Global Superstore Data using SQL and Tableau. 
**Background**: 

I was exploring Kaggle and stumbled on a Global Superstore Dataset. The interest for me was the fact that it contained global order and shipping information that can be used to generate insights into global e-commerce for some item categories.

**The Business Task**:
#### I will be using this dataset to answer the following questions:
•	*What Categories of items have the most/least orders and generate more profit?*

•	*What Categories have the most/least orders per country/market and generate more profit/loss?*

•	*What Sub categories have the most/least orders per country and generate more profit/loss?*

•	*What countries generate most/least profit and highest/lowest sales?*

•	*Which shipping mode is mostly used by customers?*

•	*Which customer segment is most profitable?*

•	*Which region generate more profit?*

**Description of the Data Source used**:

The Dataset used was found on Kaggle. It is a Global Superstore Dataset showing sales record detailing the shipping records of items categorized under **Technology, Office Supplies** and **Furniture**. The dataset subcategorized these items and showed shipping details to **147 countries** across the world. *Profit, order quantity, discounts and sales made* were also recorded in the datasets. The three customer segment the Store caters for are **Consumer, Corporate** and **Home Office**. 

**Documentation of cleaning or manipulation of data:**

#### Preparing the Data: 
The Dataset was downloaded from Kaggle as a CSV file. Profit_Margin column was added in Excel by using the formular *=Profit/sales* and the result was formatted as percentage. 

#### Data Cleaning:

I used **SQL** to clean the data. For this project, I used **Google BigQuery**. First, I imported my data into BigQuery. I then removed the Postal_Code column because it had mostly Null values and it is irrelevant to my analysis.  

I used **COUNT function** in the **SELECT statement** (*COUNT DISTINCT*) for the Row_ID column to get the total number of records because some columns such as Order ID and Customer ID, had necessary duplicates as some customers ordered multiple Items. This showed that there are 51,290 rows in the dataset. I also used the COUNT function to get the unique values for some columns as seen below: 

#### Basic Counts:

The **COUNT Distinct function** was used to get the below figures:

Number of Records – *51, 290*

Unique Product Categories – *3*

Unique Product Sub_Categories – *17*

Unique Product_Name - *3788*

Unique Customer Segment - *3*

Unique Customer_Name – *795*

Unique Customer_ID – *1590*

Unique Order_ID – *25,035*

Unique Country – *147*

Unique Region – *13*

Unique Market - *7*

I checked for duplicated values in the datasets using the **DISTINCT * function** in the **SELECT statement**. **There were no duplicates found**.

I then carried out some **Exploratory Data Analysis** on the datasets. This would help answer our business tasks and there is possibility of finding more insights.

• **What Categories of items have the most orders and generate more profit**?

The data showed that the category of items mostly ordered were **Office Supplies** which is above **60%** of total orders (*maybe because some office supplies are items that needs to be replaced frequently depending on their use*) but these items had the **lowest sales** (*maybe because they are relatively cheap*). However, **Technology** which was just **19.73%** of total orders generated the highest profit. This could mean that Technology items are expensive, although rarely ordered (*maybe because they tend to last longer*), generates more returns for the Superstore. Furniture was the lowest ordered item (*maybe because they are mostly one-off purchases that can be used overtime), although generated more sales than Office Supplies (*maybe because they are more expensive than office supplies*), are the **lowest profitable** (*maybe due to low profit margin*). 

![Sheet 1](https://user-images.githubusercontent.com/105462826/173207658-39a491a8-f90e-45df-a541-4d29b3d7d1d4.png)

#### In Summary, as shown in the visualization above, Technology generated the highest profit, about 45% of total profit which was closely followed by Office Supplies that generated about 35% of total profit (*maybe due to high profit margin because they had the lowest sales*) and the least, Furniture with just about 19% of total profit.

•	**What Categories have the most/least orders per country/market and generate more profit/loss**?

The Data showed that the category of item with the highest order was **Office Supplies** in **United States** (*22,106*) closely followed by **Furniture** in the same Country (*8,028*). Office Supply in France ranked 3rd followed by Technology in United States. The next were Office Supplies in Australia, Mexico, Germany, United Kingdom, China, Brazil, Indonesia, India, Italy. 

This just confirms that **Office Supplies** was the **highest ordered category worldwide**. The least ordered category Item was also Office Supplies in Armenia where only 1 item was ordered. Above this was Technology in Swaziland, Equatorial Guinea, Ethiopia, Djibouti and Tunisia with only just 1 order too per country. Just before this was Furniture in Macedonia, Slovakia, and Syria where just 2 of these items were ordered each.

The **most profitable Category** was **Technology** in **United States** closely followed by Office Supplies in the same Country. Technology in China, India and Mexico ranked next. The least profitable was Technology in Turkey where a loss of 34,572 was made. This was followed by Office supply and Furniture in the same Country. Countries like *Nigeria, Netherlands, Honduras, Pakistan, Philippines, Dominica Republic* amongst others, also made losses in all three categories. 

![Dashboard 3](https://user-images.githubusercontent.com/105462826/173207978-efd58b7f-1503-4e18-beb8-ded877bb39bd.png)

#### In summary, the most profitable country was United States generating profit of about 19.52% across all categories. China, India, Mexico, France, Germany, United Kingdom, Australia are also quite profitable. These Countries generates more returns for the Superstore. Whereas, Countries like Nigeria, Turkey, Netherlands have not really keyed into this items and the Superstore is making little to nothing from them.

•	**What Sub categories have the most/least orders and generate more profit/loss**?

From the COUNT analysis we did earlier, we saw there are *17 unique sub categories*. In the Sub categories too, as shown earlier, **Office Supplies** were **mostly ordered** and **Technology** generated **highest profit**. The Sub categories: *Binders* and *Storage* were mostly ordered while *Copier, Phones, Bookcases, Appliances* and *Chairs* were the most profitable Sub categories. The least sold Sub categories were Labels, Fasteners and Envelopes while Tables made a net loss.

![Sheet 5](https://user-images.githubusercontent.com/105462826/173224213-a7659775-67a8-4447-b273-e83b9c1118dd.png)

•	**What countries generate highest/lowest profit and most/least sales**?

Our tables shows the top 20 countries with most/least profit and highest/lowest sales with **United States** on top of the list for most profitable and highest sales generation. Other countries on the list includes *China, India, France* and *Germany*. It could be said that these countries top the list because of their dense population and they have a larger number of working-class citizens hence increasing demand for the products in the categories under analysis.

![Dashboard 4 (1)](https://user-images.githubusercontent.com/105462826/173225128-976b0bf2-7f0a-4b3a-8e59-b0e5d918044d.png)

One important observation from the above is that countries like Philippines and Dominican Republic though on the list of top 20 countries making highest sales are also on the list of countries making least profit.  This just shows that making high sales doesn’t necessarily transform to profit. It is unexpected and is worth further investigation.

Upon further investigation, it is noted that countries with **discount** on every order sold resulting to high average discount ranging from **0.10 to 0.85** (*all countries on the 20 least profitable countries are on this table*) tend to make losses and Philippines and Dominican Republic happen to be on this list. This may be the reason for the losses recorded in these countries despite their high sales with average discount of **0.35** and **0.24** respectively.

Another interesting observation is that Countries like **Equatorial Guinea, Armenia, Eritrea** and **Macedonia** topping the list of countries making least sales (*ranging between 150.51 to 209.64*) are not making losses whereas countries like Turkey, Nigeria and all other countries on the 20 least profit list **made higher sales than these countries but all made losses**. This data further confirms the insight made earlier, **countries averaging higher discount tend to make losses despite number of sales** because Equatorial Guinea, Armenia, Eritrea and Macedonia had no discount on their orders.

![Dashboard 5](https://user-images.githubusercontent.com/105462826/173225396-98f3a656-6571-43b6-99af-366b41b23f55.png)

•	**Which shipping mode is mostly used by customers**?

There are four(4) Shipping modes used for the delivery of ordered items, they are **First Class, Standard Class, Second Class** and **Same Day**. This suggest how the orders will be prioritized and the amount charged for deliveries. It is assumed that the Standard Class will be the cheapest while Same Day delivery will of course be more expensive as a result of the urgency.

The data reveals that **Standard Class** is used by **60%** of the customers while only 5% of the customers wanted Same Day delivery. This confirms my assumption. It is therefore pertinent that there is more focus on Standard Class items as it is made up of more than half of the ordered items.  

![Sheet 10](https://user-images.githubusercontent.com/105462826/173225488-4fa292b1-cbb4-42aa-852c-d459242ded7c.png)

•	**Which customer segment is most profitable**?

The customer segment in our data set are **Consumers, Home Office** and **Corporates**. Consumers can be said to be individuals that make personal purchases, Corporates are organizations that order items for use in their companies and Home Office could be residences where a part of the building or apartment is used as an office. My analysis revealed that the **most profitable segment** is **Consumers** closely followed by **Corporates**. Therefore, there should be more focus on these customer segment when aiming for growth.

![Sheet 11](https://user-images.githubusercontent.com/105462826/173225591-c8276983-3f97-457a-8094-617772e82b9e.png)

•	**Which region generate more profit**?

The Superstore caters to 13 regions: **West, East, Oceania, Central Asia, Canada, Africa, EMEA, North, South, North Asia, Central, SouthEast Asia** and **Caribbean**. 

The Data revealed that the three most profitable regions are **Central Region, North Region** and **North Asia Region**. These regions account for over **45%** of total profit of the Superstore so it is important that the customers in these regions are retained. Marketing strategies such as *discounts, vouchers, promotional fliers, Email updates on sales* etc. can be adopted. The least profitable regions are SouthEast Asia and Canada.

![Sheet 12](https://user-images.githubusercontent.com/105462826/173225720-ad2d553e-fe83-4d76-9878-3045a4ea224b.png)

### Below is a Dashboard showing an overview of the data:

![Dashboard 1](https://user-images.githubusercontent.com/105462826/173226024-0a4dd8dd-2fe8-4f26-909d-b80f0ed371c0.png)

#### RECCOMENDATION:

1. More attention should be given to Category **Technology** and Sub Category **Binders, Storage, Phones, Appliances** and **Copiers** as they sell more and are the most profitable. They could be put in bundle sales with items that are least sold and profitable such as *Fasteners, Labels, Supplies, tables* and *Envelope* to increase the sales and profit of these items.

2. As the **Standard Shipping** mode is used by **60%** of customers, more staff should be deployed to handle the products going through this ship mode for proper management and to avoid damages. 

3. **Consumers** and **Corporate** customers make up over **80%** of the store's customer base so all efforts should be made to retain these customers especially the ones in the **Central Region, North Region** and **North Asia Regions** with highest profit. Marketing Strategies such as *discounts, vouchers, promotional fliers, Email updates on sales* etc. can be adopted. These could also help the Store acquire more customers too.

4. Home Office customers generated lowest sales. To improve these, items used in Home offices such as *Tables, Chairs, Envelopes, Bookcases, Copiers* etc. could be sold together as a special package which will make shopping for these items easier and faster.

5. For countries making losses or less sales, the discount available should be revised or eliminated completely to improve activities in these countries.
