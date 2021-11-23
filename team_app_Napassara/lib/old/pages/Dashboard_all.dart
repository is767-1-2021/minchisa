<?xml version="1.0" encoding="utf-8"?>
<androidx.constraintlayout.widget.ConstraintLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    tools:context=".MainActivity">

    <TextView
        android:id="@+id/textView4"
        android:layout_width="wrap_content"
        android:layout_height="48dp"
        android:text="My Dashboard!"
        app:layout_constraintLeft_toLeftOf="parent"
        app:layout_constraintRight_toRightOf="parent"
        app:layout_constraintTop_toTopOf="parent" />

    <Button
        android:id="@+id/cmdSave"
        android:layout_width="102dp"
        android:layout_height="39dp"
        android:layout_marginBottom="4dp"
        android:text="บันทึกข้อมูล"
        app:layout_constraintBottom_toBottomOf="parent"
        app:layout_constraintEnd_toEndOf="parent"
        app:layout_constraintHorizontal_bias="0.511"
        app:layout_constraintStart_toStartOf="parent" />

    <LinearLayout
        android:id="@+id/linearLayout"
        android:layout_width="416dp"
        android:layout_height="565dp"
        android:layout_marginStart="39dp"
        android:layout_marginEnd="39dp"
        android:orientation="vertical"
        app:layout_constraintBottom_toTopOf="@+id/cmdSave"
        app:layout_constraintEnd_toEndOf="parent"
        app:layout_constraintHorizontal_bias="0.506"
        app:layout_constraintStart_toStartOf="parent">

        <TextView
            android:id="@+id/textView3"
            android:layout_width="match_parent"
            android:layout_height="55dp"
            android:text="ที่อยู่" />

        <EditText
            android:id="@+id/editTextTextEmailAddress"
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:ems="10"
            android:inputType="textEmailAddress" />

        <EditText
            android:id="@+id/editTextPhone"
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:ems="10"
            android:inputType="phone" />

        <EditText
            android:id="@+id/editTextNumber"
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:ems="10"
            android:inputType="number" />

        <RatingBar
            android:id="@+id/ratingBar2"
            android:layout_width="match_parent"
            android:layout_height="wrap_content" />

        <ListView
            android:layout_width="match_parent"
            android:layout_height="match_parent" />
    </LinearLayout>

    <androidx.constraintlayout.utils.widget.ImageFilterView
        android:id="@+id/imageFilterView"
        android:layout_width="71dp"
        android:layout_height="68dp"
        app:layout_constraintBottom_toTopOf="@+id/linearLayout"
        app:layout_constraintEnd_toEndOf="parent"
        app:layout_constraintHorizontal_bias="0.5"
        app:layout_constraintStart_toEndOf="@+id/textView2"
        app:layout_constraintTop_toTopOf="parent"
        app:layout_constraintVertical_bias="1.0"
        tools:srcCompat="@tools:sample/avatars" />

    <TextView
        android:id="@+id/textView"
        android:layout_width="161dp"
        android:layout_height="51dp"
        android:text="ชื่อ"
        app:layout_constraintEnd_toStartOf="@+id/textView2"
        app:layout_constraintHorizontal_bias="0.5"
        app:layout_constraintStart_toStartOf="parent"
        tools:layout_editor_absoluteY="72dp" />

    <TextView
        android:id="@+id/textView2"
        android:layout_width="163dp"
        android:layout_height="48dp"
        android:text="นามสกุล"
        app:layout_constraintEnd_toStartOf="@+id/imageFilterView"
        app:layout_constraintHorizontal_bias="0.5"
        app:layout_constraintStart_toEndOf="@+id/textView"
        tools:layout_editor_absoluteY="72dp" />

</androidx.constraintlayout.widget.ConstraintLayout>