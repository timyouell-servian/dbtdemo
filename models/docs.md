{% docs orders_status %}

Orders can be one of the following statuses:

| status         | description                                                                                                            |
|----------------|------------------------------------------------------------------------------------------------------------------------|
| placed         | The order has been placed but has not yet left the warehouse                                                           |
| shipped        | The order has ben shipped to the customer and is currently in transit                                                  |
| completed      | The order has been received by the customer                                                                            |
| return_pending | The customer has indicated that they would like to return the order, but it has not yet been received at the warehouse |
| returned       | The order has been returned by the customer and received at the warehouse                                              |


{% enddocs %}

{% docs payment_method %}

Orders can be one of the following statuses:

| status         | description                                      |
|----------------|--------------------------------------------------|
| credit_card    | The payment was done by credit card              |
| coupon         | The payment was done by cupom                    |
| bank_transfer  | payment was done by bank transfer                |
| gift_card      | payment was done by gift card                    |


{% enddocs %}
