import 'package:aimelive_app/models/project_model.dart';

List<Project> projects = [
  Project(
    puid: 'project_id',
    featurePhoto: 'software-skills.png',
    title: 'AIMELIVE FLUTTER APP',
    description:
        'My first flutter application done for facilitating all of my customers. It is made of Dart language and Flutter framework for mobile applications.',
    features:
        "User can chat directly with Admin, Video call and Voice chat, External direct link to LinkedIn Account of an admin, Social Media Links, Live Chat with community around. Easily to hire an admin, read blogs and quotes, Feedback form, Login feature, Sign up with Google, Cool animations and UI. ",
    tags: ['Node JS', 'Flutter', 'Firebase', 'UI/UX'],
    author: 'Aime Ndayambaje',
    status: 1,
    createdAt: DateTime.now(),
  ),
  Project(
    puid: 'project_id',
    featurePhoto: 'slides/slide4.jpg',
    title: 'AIMELIVE PORTFOLIO WEB',
    description:
        'This a personal blog website where you will find anything about me.',
    features: 'features of the project briefly.',
    tags: ['MERN', 'Firebase', 'UI/UX', 'HTML/CSS'],
    author: 'Aime Ndayambaje',
    status: 1,
    createdAt: DateTime.now(),
  ),
  Project(
    puid: 'project_id',
    featurePhoto: 'slides/slide4.jpg',
    title: 'Application',
    description:
        'This a personal blog website where you will find anything about me.',
    features: 'features of the project briefly.',
    tags: ['MERN', 'Firebase', 'UI/UX'],
    author: 'INTWARI Emery',
    status: 1,
    createdAt: DateTime.now(),
  ),
];
