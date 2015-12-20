# Vitrium-Net

This app serves as a base API for appending notes to patients with implanted devices. The API can be consumed with a POST request to endpoint: "/api/v1" with JSON paramaters as follows:

```
{
    "api-key": "SDFHJkjhGRDfghjTRDFghj$%^&*9!",
    "patient": "Tom Ford",
    "surgeon": {
        "name": "Selene Parekh",
        "email":"selene.parekh@gmail.com"
    },
    "devices": [
        {
            "item": "2.5mm Stryker Screw",
            "status": "confirmed",
            "timestamp": "2015-08-17T00:18:55+00:00"
        },
        {
            "item": "3.5mm Rotational Cuff",
            "status": "error",
            "timestamp": "2015-08-17T00:18:55+00:00"
        },
        {
            "item": "1mm Washer Metal Weight",
            "status": "confirmed",
            "timestamp": "2015-08-17T00:18:55+00:00"
        }
    ],
    "annotation": "This patient was seen last Friday. We need to schedule him for another appointment to review rehabilitation techniques.",
    "hospital": "Duke University Hospital",
    "password": "345678976#$%^&hos"
}
```

##The following functionality will be deployed live:

* saving unique patients with authentication to SQL database
* saving multiple entries to patient tables
* recalling entries for particular patients 
* emailing results once a patient receives a 'completed surgery' status
