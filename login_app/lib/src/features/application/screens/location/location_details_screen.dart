import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/constants/sizes.dart';
import 'package:login_app/src/constants/text_strings.dart';
import 'package:login_app/src/features/application/controllers/location_details_controller.dart';
import 'package:login_app/src/features/application/models/location_model.dart';

class LocationDetailsScreen extends StatelessWidget {
  const LocationDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LocationDetailsController());

    final formKey = GlobalKey<FormState>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'location Details',
            style: Theme.of(context).textTheme.displaySmall,
            textAlign: TextAlign.center,
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(bDefaultSize),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Kindly fill your location details'),
                  TextFormField(
                    controller: controller.subCounty,
                    decoration: const InputDecoration(
                        label: Text(bFullName),
                        prefixIcon: Icon(Icons.person_outline_rounded)),
                  ),
                  const SizedBox(height: bFormHeight - 20.0),
                  TextFormField(
                    controller: controller.ward,
                    decoration: const InputDecoration(
                        label: Text(bWard), prefixIcon: Icon(Icons.email)),
                  ),
                  const SizedBox(height: bFormHeight - 20.0),
                  TextFormField(
                    controller: controller.location,
                    decoration: const InputDecoration(
                        label: Text(bLocation),
                        prefixIcon: Icon(Icons.numbers)),
                  ),
                  const SizedBox(height: bFormHeight - 20.0),
                  TextFormField(
                    controller: controller.subLocation,
                    decoration: const InputDecoration(
                        label: Text(bSubLocation),
                        prefixIcon: Icon(Icons.location_city_rounded)),
                  ),
                  const SizedBox(height: bFormHeight - 20.0),
                  TextFormField(
                    controller: controller.village,
                    decoration: const InputDecoration(
                        label: Text(bVillage),
                        prefixIcon: Icon(Icons.holiday_village_rounded)),
                  ),
                  const SizedBox(height: bFormHeight - 20.0),
                  
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        final location = LocationModel(
                          //-- location details
                          subCounty: controller.subCounty.text.trim(),
                          ward: controller.ward.text.trim(),
                          location: controller.location.text.trim(),
                          subLocation: controller.subLocation.text.trim(),
                          village: controller.village.text.trim(),
                          
                        );
                        LocationDetailsController.instance
                            .createLocation(location);
                      },
                      child: Text(bNext.toUpperCase()),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
