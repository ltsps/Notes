# Display all columns and rows 
pd.options.display.max_columns =None
pd.options.display.max_rows=None
pd.options.display.width=50000

# Append and write to excel
--if_sheet_exists='overlay' # Append data
with pd.ExcelWriter(path=r'C:\Users\clycl\Desktop\auto_count.xlsx',mode="a",engine='openpyxl',if_sheet_exists='overlay') as write:
    df.to_excel(write,sheet_name='Sheet1',index=None)
