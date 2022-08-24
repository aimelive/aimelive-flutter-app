import 'package:aimelive_app/screens/user-app/admin/panels/Pages/my_text.dart';
import 'package:aimelive_app/services/database.dart';
import 'package:aimelive_app/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';

class AddPost extends StatefulWidget {
  const AddPost({Key? key}) : super(key: key);

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  final _title = TextEditingController();
  final _blogBody = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FocusNode searchFocusNode = FocusNode();
  FocusNode textFieldFocusNode = FocusNode();
  late SingleValueDropDownController _cnt;
  late MultiValueDropDownController _cntMulti;
  final QuillController _quillController = QuillController.basic();
  final DatabaseService _createBlog = DatabaseService(uuid: null);

  @override
  void initState() {
    _cnt = SingleValueDropDownController();
    _cntMulti = MultiValueDropDownController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double widthSize = MediaQuery.of(context).size.width;

    String _category = "";
    String imgUrl =
        "https://firebasestorage.googleapis.com/v0/b/aimelive-app.appspot.com/o/start-1abfb4fe2980eabfbbaaa4365a0692539f7cd2725f324f904565a9a744f8e214.jpeg?alt=media&token=32ae768c-ecaf-4148-b108-4fec74421d42";
    return Scaffold(
      appBar: AppBar(
        title: MyText(text: "Add Post"),
        elevation: 0.0,
        backgroundColor: themeGrey,
      ),
      body: Container(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: widthSize - 200,
                      margin: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage('assets/beach.jpg'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                        shape: BoxShape.rectangle,
                      ),
                    ),
                    Positioned(
                      bottom: 10.0,
                      right: 10.0,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: MyText(text: "Choose photo"),
                        style: ElevatedButton.styleFrom(
                          primary: themeGrey,
                          elevation: 0.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  controller: _title,
                  decoration: InputDecoration(
                    hintText: "Add a title",
                    border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 0.0),
                        borderRadius: BorderRadius.circular(12)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 0.0),
                        borderRadius: BorderRadius.circular(12)),
                    labelText: "Title",
                    contentPadding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                    fillColor: Colors.white,
                    filled: true,
                    prefixIcon: IconButton(
                        onPressed: () {},
                        padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                        icon: const Icon(Icons.person)),
                    labelStyle:
                        const TextStyle(color: Colors.grey, fontSize: 20),
                  ),
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(
                  height: 12.0,
                ),
                DropDownTextField(
                  // initialValue: "name4",
                  textFieldDecoration: InputDecoration(
                    hintText: "Choose a category",
                    prefixIcon: IconButton(
                        onPressed: () {},
                        padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                        icon: const Icon(Icons.category)),
                    border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 0.0),
                        borderRadius: BorderRadius.circular(12)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 0.0),
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  singleController: _cnt,
                  clearOption: false,
                  enableSearch: true,
                  validator: (value) {
                    if (value == null) {
                      return "Required field";
                    } else {
                      return null;
                    }
                  },

                  dropDownItemCount: 6,
                  dropDownList: const [
                    DropDownValueModel(
                        name: 'Personal blog', value: "Personal blog"),
                    DropDownValueModel(
                        name: 'Computer Programming',
                        value: "Computer Programming"),
                    DropDownValueModel(
                        name: 'Flutter',
                        value: "Flutter",
                        toolTipMsg:
                            "Flutter is a framework backed up by Google which uses Dart language."),
                    DropDownValueModel(name: 'Node Js', value: "Node Js"),
                    DropDownValueModel(
                        name: 'Quotes',
                        value: "Quotes",
                        toolTipMsg:
                            "I have nothing to declare except my genius."),
                    DropDownValueModel(name: 'Full Stack', value: "Full Stack"),
                    DropDownValueModel(name: 'Trends', value: "Trends"),
                    DropDownValueModel(name: 'News', value: "News"),
                  ],
                  onChanged: (val) {
                    setState(() {
                      _category = val.value;
                    });
                    print(_category);
                  },
                ),
                const SizedBox(
                  height: 12.0,
                ),
                //MyText(text: "Write Blog"),
                Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: themePrimaryColor),
                      borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(8.0)),
                    ),
                    child: QuillToolbar.basic(controller: _quillController)),
                Container(
                    padding: const EdgeInsets.all(12.0),
                    margin: const EdgeInsets.fromLTRB(3, 0.0, 3, 10),
                    height: MediaQuery.of(context).size.height / 3,
                    decoration: BoxDecoration(
                      color: themeLighterGrey,
                      border: Border.all(color: themePrimaryColor),
                      borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(8.0)),
                    ),
                    child: QuillEditor.basic(
                        controller: _quillController, readOnly: false)),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        //Get.defaultDialog(title: "Are you sure bro!?");
                        Get.snackbar(_title.text, "Draft Saved!");
                      },
                      icon: const Icon(Icons.drafts),
                      label: MyText(text: "Save Draft"),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red.shade400,
                        elevation: 0.0,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () async {
                        //Get.defaultDialog(title: "Are you sure bro!?");
                        dynamic response = await _createBlog.createBlog(
                            _title.text,
                            imgUrl,
                            _category,
                            _blogBody.text,
                            "_authorId",
                            1,
                            DateTime.now(),
                            DateTime.now());
                        if (response == null) {
                          Get.snackbar("Something went wrong!",
                              "We couldn't add the post for now.");
                        } else {
                          Get.snackbar(_title.text,
                              "The post has been added successfully, will be visible to all community now");
                        }
                      },
                      icon: const Icon(Icons.article),
                      label: MyText(text: "Publish"),
                      style: ElevatedButton.styleFrom(
                        primary: themePrimaryColor,
                        elevation: 0.0,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(_quillController.document.toDelta());
        },
        child: const Icon(Icons.article),
        elevation: 0.0,
        backgroundColor: themePrimaryColor,
      ),
    );
  }
}
