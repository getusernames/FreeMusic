#ifndef LOCALMUSICMODEL_H
#define LOCALMUSICMODEL_H

#include <QObject>
#include <QString>
#include <QDebug>
#include <QDir>
class LocalMusicModel : public QObject
{
    Q_OBJECT
public:
    explicit LocalMusicModel(QObject *parent = nullptr);
    void parseMusicInfo(QString path);
signals:

public slots:
private:
    struct songInfo{
        QString title;  //音乐标题
        QString Artist; //歌手
        QString path; //路径
        QString album; //专辑
        QString duration; //时长
    };
};

#endif // LOCALMUSICMODEL_H
