
//============================================================
// SALES ANALYTICS AND INVENTORY OPTIMIZATION SYSTEM
//============================================================

clc;
clear;
close;

//------------------------------------------------------------
// Load CSV File
//------------------------------------------------------------
T = readtable("C:\Users\3QIN\OneDrive\Documents\SEMESTER 4\IT Workshop\Sales.csv");

//------------------------------------------------------------
// Extract Required Columns
//------------------------------------------------------------
units_sold = matrix(T("Units Sold"), -1, 1);
revenue    = matrix(T("Total Revenue"), -1, 1);
cost       = matrix(T("Total Cost"), -1, 1);
profit     = matrix(T("Total Profit"), -1, 1);

//------------------------------------------------------------
// Calculations
//------------------------------------------------------------
n = length(revenue);
orders = 1:n;

total_units   = sum(units_sold);
total_revenue = sum(revenue);
total_cost    = sum(cost);
total_profit  = sum(profit);

avg_units     = mean(units_sold);
avg_profit    = mean(profit);
cum_profit    = cumsum(profit);

// Inventory
lead_time = 7;
safety_stock = 100;
daily_demand = total_units / 365;
reorder_level = round((daily_demand * lead_time) + safety_stock);

//------------------------------------------------------------
// Dashboard Window
//------------------------------------------------------------
scf(1);
clf();

f = gcf();
f.figure_name = "Sales Analytics Dashboard";
f.figure_size = [1550,950];

//============================================================
// 1 Revenue Trend
//============================================================
subplot(3,3,1);
plot(orders,revenue);
title("1. Revenue Trend");
xlabel("Order Number");
ylabel("Revenue ($)");

//============================================================
// 2 Profit Trend
//============================================================
subplot(3,3,2);
plot(orders,profit);
title("2. Profit Trend");
xlabel("Order Number");
ylabel("Profit ($)");

//============================================================
// 3 Cost Trend
//============================================================
subplot(3,3,3);
plot(orders,cost);
title("3. Cost Trend");
xlabel("Order Number");
ylabel("Cost ($)");

//============================================================
// 4 Units Sold
//============================================================
subplot(3,3,4);
plot(orders,units_sold);
title("4. Units Sold");
xlabel("Order Number");
ylabel("Units");

//============================================================
// 5 Profit Distribution (Readable)
//============================================================
subplot(3,3,5);
histplot(8, profit);
title("5. Profit Distribution");
xlabel("Profit ($)");
ylabel("Number of Orders");

//============================================================
// 6 Cumulative Profit
//============================================================
subplot(3,3,6);
plot(orders,cum_profit);
title("6. Cumulative Profit");
xlabel("Order Number");
ylabel("Total Profit ($)");

//============================================================
// 7 Revenue vs Cost
//============================================================
subplot(3,3,7);
bar([total_revenue total_cost]);
title("7. Revenue vs Cost");
xlabel("Revenue          Cost");
ylabel("Amount ($)");

//============================================================
// 8 Units Sold vs Profit
//============================================================
subplot(3,3,8);
plot(units_sold,profit,'r.');
title("8. Units Sold vs Profit");
xlabel("Units Sold");
ylabel("Profit ($)");

//============================================================
// 9 KPI Summary
//============================================================
subplot(3,3,9);
bar([avg_units avg_profit reorder_level]);
title("9. KPI Summary");
xlabel("Avg Units   Avg Profit   Reorder");
ylabel("Value");

//------------------------------------------------------------
// Final Report
//------------------------------------------------------------
disp("================================================");
disp(" SALES ANALYTICS REPORT ");
disp("================================================");
disp("Total Units Sold   = " + string(total_units));
disp("Total Revenue      = $" + string(total_revenue));
disp("Total Cost         = $" + string(total_cost));
disp("Total Profit       = $" + string(total_profit));
disp("Average Units      = " + string(avg_units));
disp("Average Profit     = $" + string(avg_profit));
disp("Reorder Level      = " + string(reorder_level) + " units");
disp("================================================");
