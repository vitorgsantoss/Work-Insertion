import 'package:flutter/material.dart';
import 'package:work_insertion/video.dart';

class CursoMarketing extends StatefulWidget {
  @override
  _CursoMarketingState createState() => _CursoMarketingState();
}

class _CursoMarketingState extends State<CursoMarketing> {
  List<ExpansionPanelItem> _expansionPanelItems = [
    ExpansionPanelItem(
      title: 'Módulo 1: Introdução ao Marketing',
      content: [
        'Aula 1: Fundamentos do Marketing',
        'Aula 2: Estratégias de Segmentação de Mercado',
        'Aula 3: Mix de Marketing: Os 4 Ps',
      ],
      isExpanded: false,
    ),
    ExpansionPanelItem(
      title: 'Módulo 2: Estratégias de Marketing Digital',
      content: [
        'Aula 1: Marketing de Busca (SEO e SEM)',
        'Aula 2: Marketing de Mídia Social',
        'Aula 3: Marketing por E-mail',
      ],
    ),
    ExpansionPanelItem(
      title: 'Módulo 3: Marketing de Conteúdo',
      content: [
        'Aula 1: Estratégias de Conteúdo',
        'Aula 2: Produção de Conteúdo',
        'Aula 3: Distribuição de Conteúdo',
      ],
    ),
    ExpansionPanelItem(
      title: 'Módulo 4: Marketing de Influência',
      content: [
        'Aula 1: Identificação de Influenciadores',
        'Aula 2: Estratégias de Engajamento',
        'Aula 3: Mensuração de Resultados',
      ],
    ),
    ExpansionPanelItem(
      title: 'Módulo 5: Análise de Dados em Marketing',
      content: [
        'Aula 1: Coleta de Dados',
        'Aula 2: Análise de Dados',
        'Aula 3: Visualização de Dados',
      ],
    ),
    ExpansionPanelItem(
      title: 'Módulo 6: Publicidade Online',
      content: [
        'Aula 1: Tipos de Publicidade Online',
        'Aula 2: Plataformas de Publicidade',
        'Aula 3: Estratégias de Campanha',
      ],
    ),
    ExpansionPanelItem(
      title: 'Módulo 7: Marketing de Mídias Sociais',
      content: [
        'Aula 1: Estratégias de Conteúdo para Redes Sociais',
        'Aula 2: Gestão de Comunidades Online',
        'Aula 3: Campanhas de Influência',
      ],
    ),
    ExpansionPanelItem(
      title: 'Módulo 8: SEO e SEM',
      content: [
        'Aula 1: Otimização de Motores de Busca (SEO)',
        'Aula 2: Marketing de Motores de Busca (SEM)',
        'Aula 3: Ferramentas e Técnicas',
      ],
    ),
    ExpansionPanelItem(
      title: 'Módulo 9: Branding e Identidade Visual',
      content: [
        'Aula 1: Construção de Marca',
        'Aula 2: Identidade Visual',
        'Aula 3: Estratégias de Branding',
      ],
    ),
    ExpansionPanelItem(
      title: 'Módulo 10: Marketing Internacional',
      content: [
        'Aula 1: Globalização e Marketing',
        'Aula 2: Estratégias de Entrada em Mercados Internacionais',
        'Aula 3: Desafios Culturais e Legais',
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Marketing'),
      ),
      body: SingleChildScrollView(
        child: ExpansionPanelList(
          expansionCallback: (int index, bool isExpanded) {
            setState(() {
              _expansionPanelItems[index].isExpanded = isExpanded;
            });
          },
          children: _expansionPanelItems.map((item) {
            return ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  title: GestureDetector(
                    onTap: () {
                      // Navega para a tela do vídeo ao clicar em Aula 1
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              VideoApp(videoPath: 'assets/video/Aula1.mp4'),
                        ),
                      );
                    },
                    child: Text(item.title),
                  ),
                );
              },
              body: Column(
                children: item.content
                    .map((lesson) => ListTile(
                          title: Text(lesson),
                        ))
                    .toList(),
              ),
              isExpanded: item.isExpanded,
            );
          }).toList(),
        ),
      ),
    );
  }
}

class ExpansionPanelItem {
  final String title;
  final List<String> content;
  bool isExpanded;

  ExpansionPanelItem({
    required this.title,
    required this.content,
    this.isExpanded = false,
  });
}
