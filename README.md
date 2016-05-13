# brewber-ios

## Requests

#### Log In Request
```
{
    "email": "alexjbrashear@gmail.com",
    "password": "********"
}
```

#### Log Out Request
```
{
    "not sure"   
}
```

#### Sign Up Request
```
{
    "email": "...",
    "password": "...",
    ...what other information?
}
```

#### Nearby Bars Request
```
{
    "receiver_location": "Not sure what form this should come in",
    "sender_location": "Not sure what form this should come in"
}
```

#### Bar Information Request
```
{
    "id": 1234567890
}
```

## Responses

#### Log In Response
```
{
}
```

#### Log Out Response
```
{
}
```

#### Sign Up Response
```
{
}
```

#### Nearby Bars Response
```
{
}
```

#### Bar Information Response
```
{
    "name": "Pony Bar"
    "id": 1234567890
    "location": "not sure how to represent this yet"
    "menu": [
        {
            "title": "Drafts",
            "drinks": [
                {
                    "name": "Guiness",
                    "description": "",
                    "price": 9
                },
                {
                    "name": "Blue Moon Summer",
                    "description": "Seasonal draft",
                    "price": 8
                }
            ]
        },
        {
            "title": "Shots",
            "drinks": [
                {
                    "name": "Patron",
                    "description": "tequila shot",
                    "price": 6.66
                },
                {
                    "name": "Ketel One",
                    "description": "vodka shot"
                    "price": 5
                }
            ]
        },
        {
            "title": "Drinks",
            "drinks": [
                {
                    "name": "Manhattan",
                    "description": "honestly don't know what goes into these",
                    "price": 10
                },
                {
                    "name": "Cosmopolitan",
                    "description": "honestly don't know what goes into these",
                    "price": 8
                }
            ]
        }
    ]
}
```
