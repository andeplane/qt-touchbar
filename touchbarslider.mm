#include "touchbarslider.h"

TouchBarSlider::TouchBarSlider()
{
    m_slider = [[NSSlider alloc] init];
    m_onMovedBlock = [^(double){
        emit valueChanged(m_slider.doubleValue);
    } copy];
}

TouchBarSlider::~TouchBarSlider() {
    [(id)m_onMovedBlock release];
    if(m_slider)
        [m_slider release];
}

NSSlider *TouchBarSlider::getNSSlider()
{
    return m_slider;
}

id TouchBarSlider::onMovedBlock() {
    return m_onMovedBlock;
}

double TouchBarSlider::from() const
{
    return m_slider.minValue;
}

double TouchBarSlider::to() const
{
    return m_slider.maxValue;
}

double TouchBarSlider::value() const
{
    return m_slider.doubleValue;
}

QString TouchBarSlider::label() const
{
    return m_label;
}

void TouchBarSlider::setFrom(double from)
{
    // qWarning("Floating point comparison needs context sanity check");
    if (qFuzzyCompare(m_slider.minValue, from))
        return;

    m_slider.minValue = from;
    emit fromChanged(m_slider.minValue);
}

void TouchBarSlider::setTo(double to)
{
    // qWarning("Floating point comparison needs context sanity check");
    if (qFuzzyCompare(m_slider.maxValue, to))
        return;

    m_slider.maxValue = to;
    emit toChanged(m_slider.maxValue);
}

void TouchBarSlider::setValue(double value)
{
    // qWarning("Floating point comparison needs context sanity check");
    if (qFuzzyCompare(m_slider.doubleValue, value))
        return;

    m_slider.doubleValue = value;
    emit valueChanged(m_slider.doubleValue);
}

void TouchBarSlider::setLabel(QString label)
{
    if (m_label == label)
        return;

    m_label = label;
    emit labelChanged(m_label);
}
