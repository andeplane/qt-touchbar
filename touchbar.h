#ifndef TOUCHBARCONTROLLER_H
#define TOUCHBARCONTROLLER_H

#include <QQuickItem>




class TouchBar : public QQuickItem
{
    Q_OBJECT
public:
    explicit TouchBar(QQuickItem *parent = nullptr);
signals:

public slots:

private:
    void* m_tbProvider;
    // QQuickItem interface
protected:
    virtual void itemChange(ItemChange, const ItemChangeData &) override;
};

#endif // TOUCHBARCONTROLLER_H
