import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routeam/src/bloc/blocs.dart';
import 'package:routeam/src/models/reposotitory_model.dart';
import 'package:routeam/src/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';
class RepoListTile extends StatefulWidget {
  const RepoListTile({Key? key, required this.repo}) : super(key: key);
  final RepositoryModel repo;

  @override
  State<RepoListTile> createState() => _RepoListTileState();
}

class _RepoListTileState extends State<RepoListTile> {



  @override
  Widget build(BuildContext context) {

    Future<void> _launchUrl() async {
      if (!await launchUrl(Uri.parse(widget.repo.url))) {
        RFlushbars.showErrorFlushbar(context, title: 'EROR', message: "Url cannot be opened");
      }
    }

    return ListTile(
      onTap: () => _launchUrl(),
      title: Text(widget.repo.fullname),
      subtitle: Row(
        children: [
          const Icon(Icons.remove_red_eye, size: 17,),
          const SizedBox(width: 3),
          Text(widget.repo.watchers.toString()),
          const SizedBox(width: 10),
          const Icon(Icons.star, size: 17),
          const SizedBox(width: 3),
          Text(widget.repo.stargazers.toString()),
        ],
      ),
      leading: CircleAvatar(
        foregroundImage: CachedNetworkImageProvider(
            widget.repo.author.avatarUrl
        ),
        backgroundColor: Colors.transparent,
      ),
      trailing: Material(
        child: InkWell(
          onTap: () {
            if (!widget.repo.favorite) {
              setState(() {
                widget.repo.favorite = true;
              });
              BlocProvider.of<FavoriteBloc>(context).add(FavoriteSaveEvent(widget.repo));
            } else {
              BlocProvider.of<FavoriteBloc>(context).add(FavoriteRemoveEvent(widget.repo));
              setState(() { widget.repo.favorite = false; });
              RFlushbars.showInfoFlushbar(context, title: 'INFO', message: "${widget.repo.fullname} removed from favorite");
            }
          },
          child: (widget.repo.favorite)
            ? const Icon(Icons.favorite, color: RColors.rError,)
            : const Icon(Icons.favorite_border)
        ),
      ),
    );
  }
}
