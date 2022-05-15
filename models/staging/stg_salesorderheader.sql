with
    source_data as (
        select
        /*Primary key*/
        salesorderid as order_id

        /* Foreign key*/
        , customerid as customer_id
        --, territoryid        
        , shiptoaddressid	
        , creditcardid	
        --, salespersonid	
        --, billtoaddressid	
        --, shipmethodid 	
        --, currencyrateid

        /* Colunas disponíveis para tabelas nos marts*/
        , cast(orderdate as date) as order_date 
        --, totaldue	 		
        --, revisionnumber
        --, duedate	
        --, shipdate
        --, status	
		--, onlineorderflag	
        --, purchaseordernumber	
		--, accountnumber
        --, creditcardapprovalcode
        , subtotal	 		
        --, taxamt	 		
        --, freight	 		
        --, comment	 		
        --, rowguid	 		
        --, modifieddate
 

        from {{source('AdventureWorks', 'sales_salesorderheader')}}
    )

select *
from source_data